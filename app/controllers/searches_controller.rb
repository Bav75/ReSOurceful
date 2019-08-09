class SearchesController < ApplicationController
require 'httparty'
    def index
        @searches = current_user.searches
    end

    def new
        @user = current_user
        @search = Search.new 
    end

    def create
        tags = params[:search][:tags]
        url = api_endpoint_builder(tags)
        response = HTTParty.get(url)
        # binding.pry 

        # create 5 search & answer objects 
        5.times do |i|
            answer = Answer.create(
                title: response['items'][i]['title'],
                post_link: response['items'][i]['link'],
                accepted_answer_id: response['items'][i]['accepted_answer_id'],
            )
            search = current_user.searches.build(
                answer_id: answer.id,
                tags: tags 
            )
            search.save
            # binding.pry
        end

        redirect_to user_searches_path
    end

    # will need to build both searches and associated answers within this create  method 
    #stack exchange is a GET request so I can redirect within create method to access 
    
end