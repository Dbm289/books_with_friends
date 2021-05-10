class SessionsController < ApplicationController
    def new
        if !logged_in?
            @user = User.new
            render :login
        else
            #flash[:error] = "You are already logged in!"
            redirect_to reviews_path
        end
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to reviews_path
        else
            #flash[:error] = "Sorry, looks like one of those isn't working!"
            redirect_to '/login'
        end
    end

    #def fbcreate
     #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #    u.username = auth['info']['name']
       #   u.email = auth['info']['email']
        #  u.password = auth['uid']   # Secure Random Hex for later?
        #end
        #redirect_to '/' #make sure you direct user here
    #end

    #def omniauth
     #   user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      #      u.username = request.env['omniauth.auth'][:info][:first_name]
       #     u.email = request.env['omniauth.auth'][:info][:email]
        #    u.password = SecureRandom.hex(15)
         # if user.valid?
          #  session[:user_id] = user.id
           # redirect_to root_path
         # else
          #  redirect_to login_path 
          #end 
        #end
    
    #end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
    
        if user.valid?
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          #flash[:message] = "#{user.errors.full_messages.join("")}."
          redirect_to '/login'
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
        request.env['omniauth.auth']

    end

end