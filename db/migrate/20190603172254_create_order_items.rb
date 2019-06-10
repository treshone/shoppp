class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.integer :product_id
      t.integer :product_count

      t.timestamps
    end
  end
end
