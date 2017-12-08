class YelpsController < ApplicationController
    def index
      @response = Unirest.get "https://api.yelp.com/v3/businesses/search", 
                  headers:{ Authorization: "Bearer pCluZ1j-zJynvHYngNa04hSZrClmgfe7oTUlMtMw9daYKRvOmkvvPO2PZbQpS8zNYCeuxnSa3HI9XfPVFAKxIkeEjll8TM7XMmY37JchCg3UY7QXVdhXNcfZINIpWnYx"},
                  parameters:{location: "94115", term: "food"}

    end
end
