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
        @recent_searches = [] 
        if tags.any? {|x| x.empty?}
            @user = current_user
            @search = Search.new 
            flash[:alert] = "Tag fields cannot be empty. Please fill out each tag."
            # render :new
            redirect_to new_user_search_path
        else
            url = api_endpoint_builder(tags)
            response = HTTParty.get(url)
            # binding.pry 

            if response['items'].empty?
                @user = current_user
                @search = Search.new 
                flash[:alert] = "No answers were found for the search tags provided. Please try a different combination of search tags."
                # render :new
                redirect_to new_user_search_path
            else
                # create 5 search & answer objects 
                5.times do |i|
                    answer = Answer.find_or_create_by(
                        accepted_answer_id: response['items'][i]['accepted_answer_id'],
                        title: response['items'][i]['title'],
                        post_link: response['items'][i]['link']
                    )
                    # binding.pry
                    if Search.find_duplicates(answer, current_user).empty?
                        search = current_user.searches.build(
                            answer_id: answer.id,
                            tags: tags 
                        )
                        search.save
                    else
                        search = Search.find_duplicates(answer, current_user)
                    end
                    @recent_searches << search
                    # binding.pry
                end
                # use request.referer
                # flatten searches array before passing to index for rendering 
                @recent_searches.flatten! 
                render :index
                # redirect_to user_searches_path
            end
        end
    end

    # will need to build both searches and associated answers within this create method 
    #stack exchange is a GET request so I can redirect within create method to access 
    
end