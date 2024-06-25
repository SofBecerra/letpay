class Event < ApplicationRecord
  belongs_to :user
  has_one :bill

  after_create :generate_bill_and_link

  def generate_bill_and_link
    bill = Bill.create(event: Event.last)
    self.link = "www.localhost:3000/bills/#{bill.id}"
    save
  end
end
