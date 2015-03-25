class SorceryCore < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :email,            :null => false
      t.string :address
      t.string :contact_person_name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :companies, :email, unique: true
  end
end
