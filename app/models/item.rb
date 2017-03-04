class Item < ApplicationRecord
  belongs_to :menu
  belongs_to :category
  def categories
    Category.all
  end
end
