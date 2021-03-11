class OrdersController < ApplicationController
  def index
    # ":item_id" <= From Rails Routes URI format
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(set_order_params)
    if @order_address.valid?
      # Save method is written in order_address.rb
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  
  def set_order_params
    # It can get :item_id from URI
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end