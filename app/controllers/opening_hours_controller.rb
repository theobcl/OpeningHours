class OpeningHoursController < ApplicationController
  before_action :set_shop, only: %i[create]

  def create
    @opening_hour = OpeningHour.new(opening_hour_params)
    @opening_hour.shop = @shop
    @opening_hour.save
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def opening_hour_params
    params.require(:opening_hour).permit(:day, :is_closed, :start_at, :end_at)
  end

end
