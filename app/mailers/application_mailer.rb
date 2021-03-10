
class ApplicationMailer < ActionMailer::Base
  # default from: 'from@example.com'
  # layout 'mailer'
  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

  def sendgrid
    mail= Mail.new
    mail.from = Email.new(email: 'gabriel.rioux@hotmail.com')
    mail.template_id = 'd-bf39ce6313de47df959a129f044fe3cb'
    
    personalization = Personalization.new
    personalization.add_to(Email.new(email: 'gabriel.rioux@hotmail.com'))

    mail.add_personalization(personalization)
    # mail.add_content(Content.new(
    #   type: 'text/html',
    #    value: '
    #    <html>
    #     <body>
        
    #     <h1>some text here</h1>
       
    #     </body>
    #    </html>'
       
    #    ))

    puts mail.to_json

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers

  end
end
