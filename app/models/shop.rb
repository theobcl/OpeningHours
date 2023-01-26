class Shop < ApplicationRecord
  has_many :opening_hours
  validates :name, presence: true, uniqueness: true
end
