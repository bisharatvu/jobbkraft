CarrierWave.configure do|config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJ5WZQSJBM5CKT3XA',
      aws_secret_access_key: '5MWsMCCxQ/B5wIKsmxgBF6aUPYLx9eUcqU1BAtrW',
      region:                'us-east-1',
      host:                  's3.example.com',
      endpoint:              'https://s3.amazonaws.com'
  }
  config.fog_directory = 'jobbkraft'
  config.fog_public = 'false'
  config.fog_attributes = {'Cache-Control' => "max-age=#{365.to_i}" }
end

=begin

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'jobbkraft'
  config.aws_acl    = :public_read

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
      access_key_id:     'AKIAJ5WZQSJBM5CKT3XA',
      secret_access_key: '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',
      region:            'us-east-1', # Required
      endpoint:          'https://s3.amazonaws.com' # optional, defaults to nil

  }

  # Optional: Signing of download urls, e.g. for serving private content through
  # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
  # configured:
  # config.aws_signer = -> (unsigned_url, options) do
  #   Aws::CF::Signer.sign_url(unsigned_url, options)
  # end
end
=end
