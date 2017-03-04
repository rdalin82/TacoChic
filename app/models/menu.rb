class Menu < ApplicationRecord
  has_many :items
  validates :meal, uniqueness: true

  def categories
    ids = items.collect { |i| i.category_id }.uniq
    Category.find(ids) 
  end
end
