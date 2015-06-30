class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |table|
      table.string :city, default: "NYC"
      table.boolean :likes_anchovies, default: false
      table.integer :grad_year
      table.integer :user_id
    end
  end
end
