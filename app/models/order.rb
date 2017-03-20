class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  scope :pending, -> {where(completed: false, archived:false)}
end
