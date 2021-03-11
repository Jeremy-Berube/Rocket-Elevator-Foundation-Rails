# class ThankyouMailer < ApplicationMailer
#     require 'sendgrid-ruby'
#     include SendGrid
#     require 'json'

#   def sendgrid
#     from = SendGrid::Email.new(email: 'gabriel.rioux@hotmail.com')
#     subject = "Welcome to Rocket Elevators"
#     to = SendGrid::Email.new(email: lead_params[:email])
#     content = SendGrid::Content.new(type: 'text/html', value: '<html><body> Test two one ting</body></html>')
#     mail = SendGrid::Mail.new(from, subject, to, content)

#     sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
#     response = sg.client.mail._('send').post(request_body: mail.to_json)
#     puts response.status_code
#     puts response.body
#     puts response.headers

#   end
# end
