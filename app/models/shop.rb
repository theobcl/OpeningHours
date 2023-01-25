class Shop < ApplicationRecord
  has_many :hours
  validates :name, presence: true, uniqueness: true
end
