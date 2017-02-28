class RemoveEndAndReplaceWithStop < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :end, :datetime
    add_column :menus, :stop, :datetime   
  end
end
