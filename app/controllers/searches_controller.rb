class SearchesController < ApplicationController
    
    def index
        @searches = current_user.searches
    end

    def new
        @user = current_user
        @search = Search.new 
    end

    def create
        tags = params[:search][:tags]
        api_endpoint = 'api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&accepted=True&site=stackoverflow&tagged='
        tags.each do |tag|
            if tag == tags[tags.size - 1]
                api_endpoint += "#{tag}"
            else
                api_endpoint += "#{tag};"
            end
        redirect_to api_endpoint
        binding.pry 
    end

    # will need to build both searches and associated answers within this create  method 
    #stack exchange is a GET request so I can redirect within create method to access 
    
end