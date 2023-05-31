class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :tax_free_cost
      t.integer :stock_status, default: 1

      t.timestamps
    end
  end
end
