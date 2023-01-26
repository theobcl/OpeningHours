class AddDefaultValueToIsClosedInOpeningHour < ActiveRecord::Migration[6.1]
  def change
    change_column_default :opening_hours, :is_closed, from: nil, to: false
  end
end
