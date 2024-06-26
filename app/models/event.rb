class Event < ApplicationRecord
  belongs_to :user
  has_one :bill
  has_many :users

  after_create :generate_bill_and_link

  def generate_bill_and_link
    bill = Bill.create(event: Event.last, total_amount: 0)
    self.link = "www.localhost:3000/bills/#{bill.id}"
    save
  end
end
