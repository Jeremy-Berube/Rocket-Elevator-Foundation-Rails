require 'zendesk_api'

$client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://rocketelevator9426.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = "sylfe94@hotmail.com"

  # Choose one of the following depending on your authentication choice
  config.token = "IKDtYaHbOf0xLwyqaqylWJYg22PfwQokrUFpZsQ9"

  # OAuth Authentication
  config.access_token = "7c1127484b4634af0996cc5084606466f66ff6662512b35c566053ed8d6dac6f"

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Raise error when hitting the rate limit.
  # This is ignored and always set to false when `retry` is enabled.
  # Disabled by default.
  config.raise_error_when_rate_limited = false

  # Logger prints to STDERR by default, to e.g. print to stdout:
  require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
end