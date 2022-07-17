class CreateGardens < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens do |t|

      t.string :title
      t.text :description
      t.string :orientation
      t.string :floor_type
      t.boolean :is_available
      t.boolean :parking
      t.boolean :tools_available
      t.integer :surface
      t.string :image_url
      t.string :street_number
      t.string :street_name
      t.string :zip_code
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
