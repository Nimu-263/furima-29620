class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:condition_id,:delivery_fee_burden_id,:delivery_source_id,:delivery_days_id,:price).merge(user_id: current_user.id)
  end
end
