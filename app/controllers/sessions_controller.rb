class SessionsController < ApplicationController

    def new
    end

    def create
        binding.pry
        
        if auth_hash
            @user = User.find_by(username: auth_hash['info']['nickname'])

            if @user.nil?
                @user = User.create(username: auth_hash['info']['nickname'], password: SecureRandom.hex)
                log_in(@user)
            else
                log_in(@user)
            end

            redirect_to user_path(@user)
            # add securerandom.hex gem 

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
        
    end 

    private 

    def auth_hash
        request.env['omniauth.auth']
    end

end
