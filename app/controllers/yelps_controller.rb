class YelpsController < ApplicationController
    def index

    end

    def show
        if  params[:location].present? && params[:radius].present? && params[:categories].present?
          response = Unirest.get "https://api.yelp.com/v3/businesses/search",
                    headers:{ Authorization: "Bearer #{ENV["yelp_api_key"]}"},
                    parameters:{location: params[:location], term: "food", limit: 10, radius: params[:radius], categories: params[:categories]}
          @restaurant = response.body["businesses"].sample(1) 
 
          
          if @restaurant != []        
            render "show.html.erb"
          else
            redirect_to "/yelps", :flash => { :error => "No matches found" }
          end

          @markers = '[
                       {"lng": #{@restaurant[0]["coordinates"]["longitude"]}, "lat": #{@restaurant[0]["coordinates"]["latitude"]} }
                      ]'
        else
          redirect_to "/yelps"
          flash[:alert] = "Location, Distance, and Categories are required fields" 
        end
    end
end
