
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
    personalization.add_to(Email.new(email: 'gabrioux17@gmail.com'))

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
  


    def sendgrid_mail
      from = Email.new(email: 'gabriel.rioux@hotmail.com')
      subject = 'Welcome to Rocket Elevators'
      to = Email.new(email: 'gabrioux17@gmail.com')
      content = Content.new(type: 'text/plain', value: 'Greetings Customer

      We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project.
      
      A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
      
      We’ll Talk soon
      
      The Rocket Team')
      mail = SendGrid::Mail.new(from, subject, to, content)
      # puts JSON.pretty_generate(mail.to_json)
      puts mail.to_json

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
      
    end

end
