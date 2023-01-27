class Shop < ApplicationRecord
  has_many :opening_hours, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  # TO DO : make sure there at least an instance for each day of the week to validate a shop instance

  def sort_week_days()
    week_days = opening_hours.day.values
    index = week_days.index(Date.current.strftime("%A").downcase)
    return week_days.rotate(index)
  end

  def sorted_opening_hours_per_day
    weekday_order = sort_week_days()
    grouped_days = opening_hours.group_by(&:day)
    sorted_grouped_days = grouped_days.sort_by { |key, _value| weekday_order.index(key) }.to_h
  end
end
