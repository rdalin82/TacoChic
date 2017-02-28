class MenusRemoveDateTimeAndAddTime < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :stop, :datetime
    remove_column :menus, :start, :datetime
    add_column :menus, :start, :time
    add_column :menus, :stop, :time   
  end
end
