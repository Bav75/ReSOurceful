class SessionsController < ApplicationController

    def new
    end

    def create      
        #StackExchange Oauth login   
        if auth_hash
            @user = User.find_or_create_from_oauth(auth_hash)
            log_in(@user)
            redirect_to user_path(@user)
        # normal login with username / password 
        else 
            @user = User.find_by(username: params[:session][:username])
            if @user && @user.authenticate(params[:session][:password])
                log_in(@user)
                redirect_to user_path(@user)
            else
                flash[:alert] = "Invalid username and/or password provided."
                redirect_to login_path
            end
        end
    end

    def destroy
        session.clear

        redirect_to login_path
    end 

    private 

    def auth_hash
        request.env['omniauth.auth']
    end

end
