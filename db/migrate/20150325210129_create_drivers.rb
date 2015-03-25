class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :phone
      t.integer :company_id
      t.string :address
      t.integer :max_capacity
      t.integer :current_capacity
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
