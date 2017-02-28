class Menu < ApplicationRecord
  has_many :items
  validates :meal, uniqueness: true
end
