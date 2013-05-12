CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AKIAIY7YSXJ4LCJECTQA"],
    aws_secret_access_key: ENV["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"],
    region: ENV["sydney"]
  }
  config.fog_directory = ENV["recipebinder"]
end

