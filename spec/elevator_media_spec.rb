require 'ElevatorMedia'
require 'spec_helper'
require 'rails_helper'

RSpec.describe ElevatorMedia::Streamer do 
    describe "GetContent" do

        context "New instance" do
            
            streamer = ElevatorMedia::Streamer.new()

            it "Randommizer" do 
                r = streamer.pokemonRandomizer()
                expect(r).to be_between(1 , 478)
            end 

            it "Pokedex entry" do 
                x = streamer.getContent()
                name = streamer.getPokemonName()
                types = streamer.getPokemonType()
                id = streamer.getPokemonId()
                stats = streamer.getPokemonStat()
                puts ("      Pokedex entry number: " + id.to_s)
                puts ("      Name: " + name)
                puts ("      Type: " + types)
                puts ("      Base Stats Total: " + stats.to_s)
                expect(x).to be_a(String)
            end

            it "HTML" do 
                h = streamer.showInHtml(@random_pokemon)
                expect(h).not_to be(nil)
                expect(h).to include("<div>","</div>")
            end
        end
        
    end
end

