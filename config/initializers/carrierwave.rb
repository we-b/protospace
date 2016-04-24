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

    else
     config.fog_directory = 'dummy'
     config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.dummy'
  end
end
