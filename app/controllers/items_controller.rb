class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @items = Item.includes(:user, :order).order("created_at DESC")
  end

  def new
    # @hashes = CsvHasher.get_hashes
    @item = Item.new
  end

  def create
    @item = Item.new(set_item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(set_item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
  end

  private
  def set_item_params
    params.require(:item).permit(:title, :price, :description, :condition_id, :mailing_cost_id, :prefecture_id, :days_til_post_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
