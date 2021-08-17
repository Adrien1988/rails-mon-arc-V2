class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :equipment
      t.integer :price
      t.string :state
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :mark
      t.string :matter
      t.integer :resistance
      t.integer :length
      t.integer :waist
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
