class CreateOpeningHours < ActiveRecord::Migration[6.1]
  def change
    create_table :opening_hours do |t|
      t.references :shop, null: false, foreign_key: true
      t.integer :day
      t.boolean :is_closed
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
