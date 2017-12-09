class YelpsController < ApplicationController
    def index

    end

    def show
        response = Unirest.get "https://api.yelp.com/v3/businesses/search",
                  headers:{ Authorization: "Bearer #{ENV["yelp_api_key"]}"},
                  parameters:{location: params[:location], term: "food", limit: 10, radius: params[:radius], categories: params[:categories]}
        @restaurant = response.body["businesses"].sample(1) 
        if @restaurant != []        
          render "show.html.erb"
        else
          redirect_to "/yelps", :flash => { :error => "No matches found" }
        end

    end
end
