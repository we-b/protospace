CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.aws.access_key,
    aws_secret_access_key: Settings.aws.secret_access_key,
    region: Settings.aws.s3_bucket_region,
  }

  case Rails.env
    when 'development'
     config.fog_directory = Settings.aws.s3_bucket_name_dev
     config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/#{config.fog_directory}"
   when 'production'
     config.fog_directory = 'production.example.com'
     config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/example.com'
  end

  if Rails.env.test? 
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
  end
end
