class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            log_in(@user)
            redirect_to user_path(@user)
        else
            flash[:alert] = "Invalid email and/or password provided."
            redirect_to login_path
        end
    end

    def destroy
        
    end 

    private 

    def auth_hash
        request.env['omniauth.auth']
    end

end
