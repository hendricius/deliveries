class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :content
      t.integer :driver_id
      t.integer :company_id
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
