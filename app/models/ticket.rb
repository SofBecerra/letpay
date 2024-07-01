class Ticket < ApplicationRecord
  require 'google/cloud/vision'
  belongs_to :bill

  has_many :users
  has_one_attached :photo

  def text_from_image
    return unless photo.attached?

    vision = Google::Cloud::Vision.image_annotator
    image_path = photo.url

    response = vision.text_detection(image: image_path)
    texts = response.responses.first.text_annotations

    texts[0]&.description
  end
end
