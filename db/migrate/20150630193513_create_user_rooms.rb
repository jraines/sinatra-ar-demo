class CreateUserRooms < ActiveRecord::Migration
  def change
    create_table :user_rooms do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :rating
    end
  end
end
