class YelpsController < ApplicationController
    def index
      @response = Unirest.get "https://api.yelp.com/v3/businesses/search", 
                  headers:{ Authorization: "Bearer "},
                  parameters:{location: "94115", term: "food"}

    end
end
