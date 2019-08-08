class SearchesController < ApplicationController
    
    def index
        @searches = current_user.searches
    end

    def new
        @user = current_user
        @search = Search.new 
    end

    def create
        binding.pry 
    end

    # will need to build both searches and associated answers within this create  method 
    
end