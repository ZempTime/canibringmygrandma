class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :answer
      t.integer :user_id
      t.integer :photo_id

      t.timestamps null: false
    end
  end
end
