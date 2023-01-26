class OpeningHour < ApplicationRecord
  belongs_to :shop

  extend Enumerize
  enumerize :day, in: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  validates :shop_id, presence: true
  validates :day, presence: true, inclusion: { in: 0..6 }
  validates :is_closed, presence: true
  validates :start_at, presence: :true, unless: :is_closed
  validates :end_at; presence: :true, unless: :is_closed

  validates_time :start_at, before: :end_at, unless: :is_closed

  validates_uniqueness_of :day, scope: :shop_id, conditions: -> { where(is_closed: true) }, message: "can only have one closed time for a given day"
  validates_uniqueness_of :day, scope: :shop_id, conditions: -> { where(is_closed: false) }, limit: 2, message: "can't have more than two opening hour for the same day"

  # TO DO : make sure there is no overlaping hours for the same opening day
end
