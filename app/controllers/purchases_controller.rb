class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @user_purchase = UserPurchase.new
  end
 
  def create
    @user_purchase = UserPurchase.new(purchase_params)
      if @user_purchase.valid?
        pay_item
        @user_purchase.save
        redirect_to root_path
      else
        render action: :index
      end
  end
 
  private
  def purchase_params
   params.require(:user_purchase).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    if current_user.id == @item.user.id || Purchase.exists?(item_id: [@item.id])
      redirect_to root_path
    end
  end
end
