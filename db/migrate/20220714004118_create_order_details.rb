class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id
      t.integer :item_id
      t.integer :past_item_cost
      t.integer :amount
      t.integer :create_status, default: 0
      t.timestamps
    end
  end
end
