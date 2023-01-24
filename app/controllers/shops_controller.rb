class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def create
    @shop = shop.new(shop_params)
    @shop.save
  end

  private

  def shop_params
    params.require(:shop).permit(:name)
  end
end
