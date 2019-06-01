class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :catalog_id
      t.string :comment
      t.string :photos
      t.integer :rating

      t.timestamps
    end
  end
end
