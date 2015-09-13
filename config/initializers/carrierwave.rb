CarrierWave.configure do |config|
  unless Rails.env.test?
    config.asset_host = ENV['UPLOAD_HOST']
    config.root = ENV['UPLOAD_DIR']
  end
end
