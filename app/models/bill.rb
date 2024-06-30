class Bill < ApplicationRecord
  belongs_to :event
  has_many :items
  has_many :users, through: :items
  has_many :tips

  def sum_items
    items.sum(:price)
  end

  def remaining_amount
    return 0 unless total_amount
    total_amount.to_f - sum_items
  end

  def consumption_by_user
    items.group(:user).sum(:price)
  end

  def participants_count
    items.select(:user_id).distinct.count
  end

  def total_peruser
    return 0 if participants_count == 0
    total_amount.to_f / participants_count
  end

  def tip
  end
end
