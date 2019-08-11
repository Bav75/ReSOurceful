class UsersController < ApplicationController

   def new
    @user = User.new 
   end 

   def create
    # binding.pry
    
    if User.find_by(username: params[:user][:username])
        flash[alert] = "This username already exists. Please try a different username."
        redirect_to new_user_path
    else
        @user = User.create(user_params)

        if @user.persisted?
            log_in(@user)
            redirect_to user_path(@user)
        else
            #if user didn't persist - load errors to flash msg & redirect 
            @user.errors.messages.each do |error_symbol, message|
                flash[error_symbol] = "There appears to be an error: #{error_symbol} #{message[0]}"
            end
            redirect_to new_user_path
        end
    end

   end

   def show 
    @user = User.find(session[:user_id].to_i)
   end 

   def edit
    # binding.pry
   end


   private

   def user_params
    params.require(:user).permit(:username, :password)
   end

end
