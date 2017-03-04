class AddMenuReferenceToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :menu, foreign_key: true, index: true 
  end
end
