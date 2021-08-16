class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    query = "SELECT * FROM items order by created_at DESC"
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end

private

def item_params
  params.require(:item).permit(:name, :description, :category_id, :charge_id, :condition_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
end