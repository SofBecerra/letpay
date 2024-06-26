class Bill < ApplicationRecord
  belongs_to :event
  has_many :items

  def sum_items
    items.sum(:price)
  end

  def remaining_amount
    total_amount - sum_items
  end
end
