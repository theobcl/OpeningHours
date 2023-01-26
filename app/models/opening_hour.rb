class OpeningHour < ApplicationRecord
  belongs_to :shop

  extend Enumerize
  enumerize :day, in: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday], default: :monday

  validates :shop_id, presence: true
  validates :day, presence: true, inclusion: { in: 0..6 }
  validates :is_closed, presence: true
  validates :start_at, presence: :true
  validates :end_at; presence: :true
end
