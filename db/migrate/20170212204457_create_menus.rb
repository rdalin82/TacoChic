class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :meal
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
