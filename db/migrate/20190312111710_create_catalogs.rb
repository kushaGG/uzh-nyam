class CreateCatalogs < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogs do |t|
      t.string :title
      t.string :location
      t.string :phone_number
      t.time :open_time_monday
      t.time :open_time_tuesday
      t.time :open_time_wednesday
      t.time :open_time_thursday
      t.time :open_time_friday
      t.time :open_time_saturday
      t.time :open_time_sunday
      t.time :close_time_monday
      t.time :close_time_tuesday
      t.time :close_time_wednesday
      t.time :close_time_thursday
      t.time :close_time_friday
      t.time :close_time_saturday
      t.time :close_time_sunday
      t.string :description
      t.string :photos
      t.boolean :has_free_wifi
      t.string :address

      t.timestamps
    end
  end
end
