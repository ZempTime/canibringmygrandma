class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.text :image_data
      t.integer :views, default: 0

      t.timestamps null: false
    end
  end
end
