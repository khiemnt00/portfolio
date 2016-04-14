if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:                   'AWS',
        aws_access_key_id:         Settings.aws_access_key_id,
        aws_secret_access_key:     Settings.aws_secret_access_key,
        region:                    Settings.aws_region
    }
    config.fog_directory = Settings.s3_bucket
    config.permissions = 0666
    config.directory_permissions = 0777
    config.storage = :fog
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/