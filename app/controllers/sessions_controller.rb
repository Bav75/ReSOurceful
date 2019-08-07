class SessionsController < ApplicationController

    def new
    end

    def create
        # binding.pry
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "Invalid email and/or password provided."
            redirect_to login_path
        end
    end

    def destroy
    end 

end
