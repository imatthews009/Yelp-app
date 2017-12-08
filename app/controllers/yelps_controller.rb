class YelpsController < ApplicationController
    def index
      @response = Unirest.get "https://api.yelp.com/v3/businesses/search", 
                  headers:{ Authorization: "Bearer #{ENV["yelp_api_key"]}"},
                  parameters:{location: params[:location], term: "food", limit: 10}

    end
end
