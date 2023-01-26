class ChangeDayTypeInOpeningHour < ActiveRecord::Migration[6.1]
  def change
    change_column :opening_hours, :day, :string
  end
end
