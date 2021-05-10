class ApplicationController < ActionController::Base
    include ApplicationHelper

    skip_before_action :verify_authenticity_token


    def welcome
    end

  private
    def check_for_logged_in
      redirect_to '/' if !logged_in?
    end
end
