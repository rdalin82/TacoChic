class Menu < ApplicationRecord
  has_many :items
  has_many :categories
  validates :meal, uniqueness: true
end
