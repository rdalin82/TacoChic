class AddCompletedandArchivedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :completed, :boolean, default: false
    add_column :orders, :archived, :boolean, default: false 
  end
end
