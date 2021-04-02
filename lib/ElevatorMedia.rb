require 'httparty'
require 'json'
include ActionController::MimeResponds
include AbstractController::Rendering

module ElevatorMedia
    class Streamer   

        # API call
        def getContent
            @random_pokemon = HTTParty.get("https://pokeapi.co/api/v2/pokemon/" + (self.pokemonRandomizer()).to_s)
            @get_pokemon_name = self.getPokemonName
            @get_pokemon_type = self.getPokemonType
            @get_pokemon_id = self.getPokemonId.to_s
            @base_stat_total = self.getPokemonStat.to_s                      
        end

        # Randomize Pokemon
        def pokemonRandomizer
            @pokemon_randomizer = rand(1..478)
        end

        # Get Pokemon Name 
        def getPokemonName
            JSON.parse(@random_pokemon.body)["name"]
        end

        # Get Pokemon type
        def getPokemonType
            JSON.parse(@random_pokemon.body)["types"][0]["type"]["name"]
        end

        # Get Pokemon entry number
        def getPokemonId 
            JSON.parse(@random_pokemon.body)["id"]
        end

        # Get each base stat of pokemon and add them
        def getPokemonStat 
            @hp = JSON.parse(@random_pokemon.body)["stats"][0]["base_stat"]
            @attack = JSON.parse(@random_pokemon.body)["stats"][1]["base_stat"]
            @defense = JSON.parse(@random_pokemon.body)["stats"][2]["base_stat"]
            @sp_atk = JSON.parse(@random_pokemon.body)["stats"][3]["base_stat"]
            @sp_def = JSON.parse(@random_pokemon.body)["stats"][4]["base_stat"]
            @speed = JSON.parse(@random_pokemon.body)["stats"][5]["base_stat"]

            @base_stat_total = @hp + @attack + @defense + @sp_atk + @sp_def + @speed 
        end
        
        # Make it show in html
        def showInHtml(data)
            "<div>#{data}</div>"
        end
    end
end
