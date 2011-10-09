twilio_config = YAML.load_file("#{Rails.root}/config/twilio.yml")[Rails.env]

Twilio::Config.setup \
  :account_sid  => twilio_config[:account_sid],
  :auth_token   => twilio_config[:auth_token]