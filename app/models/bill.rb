class Bill < ApplicationRecord
  belongs_to :event
  has_many :items

  def sum_items
    items.sum(:price)
  end

  def remaining_amount
    return 0 unless total_amount
    total_amount.to_f - sum_items
  end
end
