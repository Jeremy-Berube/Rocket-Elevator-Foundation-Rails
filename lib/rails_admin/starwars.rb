require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

module RailsAdmin
  module Config
    module Actions
      class Starwars < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end
        
        register_instance_option :breadcrumb_parent do
          nil
        end
        
        register_instance_option :auditing_versions_limit do
          100
        end

        register_instance_option :route_fragment do
          'starwars.html.erb'
        end

        register_instance_option :link_icon do
          'icon-check'
        end

        register_instance_option :statistics? do
          false
        end


        register_instance_option :controller do
          proc do
            authenticator = Authenticators::IamAuthenticator.new(
              apikey: ENV["IBM_STARWARS_API"]
            )
            text_to_speech = TextToSpeechV1.new(
              authenticator: authenticator
            )
            text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/256a7c50-6f05-4f1d-b6e3-55104f134aac"
            puts text_to_speech
            File.open("app/assets/audios/starwars.mp3" , "wb") do |audio_file|
              quotes = text_to_speech.synthesize(
                text: Faker::Movies::StarWars.quote,
                accept: "audio/mp3",
                voice: "en-US_MichaelV3Voice"
              ).result 
              puts quotes
            audio_file.write(quotes)
            end
          end
        end

      end
    end
  end
end