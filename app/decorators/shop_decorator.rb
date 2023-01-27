class ShopDecorator < ApplicationDecorator
  decorates_associations :opening_hours

  def sort_week_days
    week_days = object.opening_hours.day.values
    index     = week_days.index(Date.current.strftime("%A").downcase)
    week_days.rotate(index)
  end

  def sorted_opening_hours_per_day
    weekday_order = sort_week_days()
    grouped_days  = opening_hours.group_by(&:day)
    grouped_days.sort_by { |key, _value| weekday_order.index(key) }.to_h
  end
end
