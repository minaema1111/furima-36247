class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :sold_out_item, only: [:index]

  def index
    @purchase_residence = PurchaseResidence.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_residence = PurchaseResidence.new(purchase_residence_params)
    if @purchase_residence.valid?
      pay_item
      @purchase_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_residence_params
    params.require(:purchase_residence).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def sold_out_item
    redirect_to root_path if @item_purchase.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_residence_params[:token],
      currency: 'jpy'
    )
  end
end
