twilio_config = YAML.load_file("#{Rails.root}/config/twilio.yml")[Rails.env]

Twilio::Config.setup \
  :account_sid  => ENV["TWILIO_ACCOUNT_SID"],
  :auth_token   => ENV["TWILIO_AUTH_TOKEN"]