class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :postal_code
      t.text :place
      t.string :name
      
      t.timestamps
    end
  end
end
