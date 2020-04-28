# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key = '6LfONe8UAAAAAKZUiPmEffmtjY1rE9nBNMnT8sxk'
  config.secret_key = '6LfONe8UAAAAAIjqQUPxgXKOv1WIpG6H3pme-kZt'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end
