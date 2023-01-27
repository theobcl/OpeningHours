class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id]).decorate
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
