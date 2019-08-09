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
        binding.pry 
        tags = params[:search][:tags]
        if tags.any? {|x| x.empty?}
            @user = current_user
            @search = Search.new 
            flash[:alert] = "Tag fields cannot be empty. Please fill out each tag."
            render :new
        else
            url = api_endpoint_builder(tags)
            response = HTTParty.get(url)
            # binding.pry 

            if response['items'].empty?
                @user = current_user
                @search = Search.new 
                flash[:alert] = "No answers were found for the search tags provided. Please try a different combination of search tags."
                render :new
            else
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
                # binding.pry
                # use request.referer
                redirect_to user_searches_path
            end
        end
    end

    # will need to build both searches and associated answers within this create method 
    #stack exchange is a GET request so I can redirect within create method to access 
    
end