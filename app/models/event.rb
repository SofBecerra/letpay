class Event < ApplicationRecord
  require 'google/cloud/vision'
  
  belongs_to :user
  has_one :bill
  has_one_attached :qrcode
  has_many :items, through: :bill
  has_many :participants, through: :items, source: :user
  has_one_attached :photo

  after_create :generate_bill_and_link

  def generate_bill_and_link
    bill = Bill.create(event: Event.last, total_amount: 0)
    # bill = Bill.create(event: Event.last, total_amount: 0)
    # #self.link = "www.localhost:3000/bills/#{bill.id}"
    event = Event.last
    event.link = "https://letpay-6e5f9b6e77f8.herokuapp.com/bills/#{bill.id}"
    event.save
    save
  end

  def text_from_image
    return unless photo.attached?

    vision = Google::Cloud::Vision.image_annotator
    image_path = photo.url

    response = vision.text_detection(image: image_path)
    texts = response.responses.first.text_annotations

    texts[0]&.description
  end
end
