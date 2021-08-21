class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :sold_out_item, only: [:edit]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :charge_id, :condition_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    redirect_to root_path unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out_item
    redirect_to root_path if current_user.id != @item.user_id || @item.purchase.present?
  end
end
