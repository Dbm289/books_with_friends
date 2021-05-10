class UsersController < ApplicationController

    def new
        if !logged_in?
            @user = User.new
        else
            redirect_to reviews_path
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to reviews_path
        else
          render :new
        end
      end

    def index
        @users = User.all

    end

    def reviews_index
        @user = User.find(params[:id])
        @reviews = @user.reviews
        render template: 'reviews/index'
      end
    
      def review
        @user = User.find(params[:id])
        @review = Review.find(params[:review_id])
        render template: 'reviews/show'
      end 

      def show
        @user = User.find(params[:id])
      end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end


end
