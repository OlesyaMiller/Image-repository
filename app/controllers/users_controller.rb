class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save && @user.valid?
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update 
        @user = User.find_by(id: params[:id])
        if @user
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    private
    
    def user_params
        params.require(:user).permit(
            :username, 
            :email, 
            :password, 
            :password_confirmation
        )
    end    
end
