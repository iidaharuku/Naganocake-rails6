class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :end_user_id
      t.string :postal_code
      t.text :send_address
      t.string :address_name
      t.string :pay_way
      t.integer :postage
      t.integer :total_cost
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
