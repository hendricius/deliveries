class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :content
      t.integer :driver_id
      t.integer :company_id
      t.float :from_latitude
      t.float :from_longitude
      t.string :from_address
      t.float :to_latitude
      t.float :to_longitude
      t.string :to_address
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
