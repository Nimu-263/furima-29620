class PurchasesController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
  end
 
  def create
    @user_purchase = UserPurchase.new(purchase_params)
      if @user_purchase.valid?
        @user_purchase.save
        redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        render action: :index
      end
  end
 
  private
  def purchase_params
   params.require(:user_purchase).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
