class SessionsController < ApplicationController
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to reviews_path
        else
            flash[:error] = "Sorry, looks like one of those isn't working!"
            redirect_to '/login'
        end
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.username = auth['info']['name']
          u.email = auth['info']['email']
          u.password = auth['uid']   # Secure Random Hex for later?
        end
    end

    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        #binding.pry
        request.env['omniauth.auth']

    end

end