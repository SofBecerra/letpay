class Event < ApplicationRecord
  belongs_to :user
  has_one :bill
  has_one_attached :qrcode

  after_create :generate_bill_and_link

  def generate_bill_and_link
    bill = Bill.create(event: Event.last)
    link = "www.localhost:3000/bills/#{bill.id}"
    qr = RQRCode::QRCode.new(link)
    png = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 500
      )

    qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png"
    )

    save
  end
end
