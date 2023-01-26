class Shop < ApplicationRecord
  has_many :opening_hours, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  # TO DO : make sure there at least an instance for each day of the week to validate a shop instance
end
