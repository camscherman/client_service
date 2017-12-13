class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :title
      t.string :upc_code
      t.string :price
      t.string :status, default: "pending"
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
