Obscenity.configure do |config|
  config.blacklist   = "sentinel/blacklist.yml"
  config.whitelist   = ['safe']
  config.replacement = :default
end
