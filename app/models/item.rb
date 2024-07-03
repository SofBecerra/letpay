class Item < ApplicationRecord
  belongs_to :bill
  belongs_to :user
  broadcasts_to -> (item) {"items"}, inserts_by: :prepend

  #validates :price, presence: true
  #validates :price, numericality: { only_integer: true, less_than_or_equal_to: 999999 }
end
