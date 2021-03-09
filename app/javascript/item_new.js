"use strict";

window.addEventListener("load", function () {
  const priceInput = document.getElementById("item-price");
  const commissionPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  // taxPrice.innerHTML = "Test ";
  const eventsHash = {
    clickTest: function (element) {
      element.addEventListener("click", function () {
        console.log("Click Ok");
      });
    },
    priceMorph: function (element, element_2, element_3) {
      element.addEventListener("input", function () {
        console.log(element.value);
        var commission = element.value * 0.1;
        element_2.innerHTML = `${parseInt(commission)} `;
        element_3.innerHTML = `${parseInt(element.value - commission)} `;
      });
    },
  };

  eventsHash.clickTest(priceInput);
  eventsHash.priceMorph(priceInput, commissionPrice, profit);
});
