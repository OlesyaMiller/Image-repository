class SessionController < ApplicationController

        def new  
        end
    
        def create
            @user = User.find_by(username: params[:username]) 
            # byebug
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                render :signin
            end
        end
    
        def destroy
            session.delete("user_id") 
            redirect_to root_path
        end
    
end
