class Bill < ApplicationRecord
  belongs_to :event
  has_many :items

  def sum_items
    total = self.total_amount
    pay = self.items.map(&:price).sum
  end
end
