class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_item, only: [:new, :create, :index]
  # before_action :order_security, only: [:new, :create, :index]
  
  def index
    # ":item_id" <= From Rails Routes URI format
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    @order_address = OrderAddress.new
    @tax_price = (@item.price * 1.10).to_i
  end

  def create
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    @tax_price = (@item.price * 1.10).to_i

    if @tax_price > 9999999
      @tax_price = 9999999
    end

    @order_address = OrderAddress.new(set_order_params)
    # binding.pry
    if @order_address.valid?
      pay_item
      # Save method is written in order_address.rb
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def find_item
    # It can get :item_id from URI
    @item = Item.find(params[:item_id])
  end

  def order_security
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
  def set_order_params
    # It can get :item_id from URI
    # params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, price: @tax_price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: set_order_params[:price],
      card: set_order_params[:token],
      currency: 'jpy'
    )
  end
end