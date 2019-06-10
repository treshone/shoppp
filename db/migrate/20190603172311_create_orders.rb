class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :status, foreign_key: true
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.text :comment

      t.timestamps
    end
  end
end
