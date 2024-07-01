class Item < ApplicationRecord
  belongs_to :bill
  belongs_to :user
  broadcasts_to -> (item) {"items"}, inserts_by: :prepend
end
