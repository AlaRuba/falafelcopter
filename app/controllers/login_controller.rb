require 'bcrypt'
require 'digest/sha1'


class LoginController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  def main
  	patient = Patient.new
  	patient.entry = Time.now.to_i
  	patient.answers = ""
  	patient.save
  	@patient_id = patient.id
  	render "asddsaads"
  	render "questions/main"
  end

	def login
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			redirect_to(:action => 'home')
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
  	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			render "login/main"
			#redirect_to(:action => 'main')
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end

	def register
	end

	def create
		if params[:password].eql?(params[:password_repeat])
			user = User.new(:username => params[:username], :password => Digest::SHA1.hexdigest(params[:password]))
			user.save
			render "login"
		else
			flash[:notice] = "Password does not match"
			render "register"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

end
