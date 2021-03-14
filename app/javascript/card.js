"use strict";

const pay = () => {
  console.log("Const Pay");
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", function (e) {
    // Prevent html from submitting form simultaneously.
    e.preventDefault();

    console.log("Submit Detected");

    // Re-fetching form after it has been filled in.
    const formResult = document.getElementById("charge-form");
    // Create AJAX FormData with filled form.
    const formData = new FormData(formResult);

    // Extracting credit card input form the form and hashing into object.
    // Using formData.get() by the name attribute of the input fields.
    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };

    // This API method requires a card object and a function.
    // Function's got 2 receiving inputs.
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        // console.log(token);

        // Re-fetch form once again.
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        // const tokenObj = `<input value=${token} name='token'>`
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", function () {
  console.log("Loaded");
  pay();
});
