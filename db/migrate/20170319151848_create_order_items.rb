class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, index:true, foreign_key: true
      t.references :item, index:true, foreign_key: true
      t.timestamps
    end
  end
end
