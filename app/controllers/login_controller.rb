class LoginController < ApplicationController
	skip_before_filter :authenticate_user
	before_action :save_login_state, :only => [:login, :login_attempt]

	layout false

	def index

	end

	def login
		authorized_user = User.authenticate(params[:username],params[:password])
		
	    if authorized_user
	    	authorized_user.last_login = DateTime.now.to_date
	    	authorized_user.save
	    	session[:user_id] = authorized_user.id
	      	flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.user_name}"	      
	      	redirect_to(:controller => 'index')
	    else
	      	flash[:notice] = "Invalid Username or Password"
	      	flash[:color]= "invalid"	            
	      	redirect_to(:action => 'login')
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

end
