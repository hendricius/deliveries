class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.text :tour
      t.text :capacityarray
      t.integer :time
      t.integer :driver_id
      t.integer :kind

      t.timestamps null: false
    end
  end
end
