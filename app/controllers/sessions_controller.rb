class SessionsController < ApplicationController
	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]
end
