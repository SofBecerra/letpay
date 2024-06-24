class Event < ApplicationRecord
  belongs_to :user
  has_one :bill
end
