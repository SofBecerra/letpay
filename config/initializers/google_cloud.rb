require 'google/cloud/vision'

Google::Cloud::Vision.configure do |config|
  config.credentials = Rails.root.join('config/credentials/vision.json').to_s
end
