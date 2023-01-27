class OpeningHour < ApplicationRecord
  include Draper::Decoratable

  belongs_to :shop

  extend Enumerize
  enumerize :day, in: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  validates :shop_id, presence: true
  validates :day, presence: true
  validates :is_closed, inclusion: { in: [true, false] }
  validates :start_at, presence: true, unless: :is_closed
  validates :end_at, presence: true, unless: :is_closed

  validates_time :start_at, before: :end_at, unless: :is_closed

  validate :limited_number_of_hours
  validate :no_overlapping_hours

  private

  def limited_number_of_hours
    hours = shop.opening_hours.where(day: day)

    if is_closed && hours.count >= 1
      errors.add(:base, "can only have one closed time for a given day")
    elsif !is_closed && (hours.count >= 2 || hours.where(is_closed: true).count >= 1)
      errors.add(:base, "can't have more than two opening hour for the same day")
    end
  end

  def no_overlapping_hours
    existing_hours = shop.opening_hours.where(day: day).first

    if !is_closed && existing_hours
      if (start_at - existing_hours.end_at) * (existing_hours.start_at - end_at) > 0
        errors.add(:base, "overlapping hours on #{day}")
      end
    end
  end
end
