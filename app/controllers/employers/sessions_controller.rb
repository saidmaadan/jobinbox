class Employers::SessionsController < ApplicationController
	def new
	end

	def create
		if
			employer = Employer.authenticate(params[:email_address], params[:password])
			#session[:employer_id] = employer.id
			if params[:remember_me]
	        	cookies.permanent[:auth_token] = employer.auth_token
	      	else
	        	cookies[:auth_token] = employer.auth_token
	      	end
			flash[:notice] = "Welcome back, #{employer.name}!"
			redirect_to(session[:intended_url] || employer)
			session[:intended_url] = nil
		
		else
			flash.now[:alert] = "Invalid email/password combination!"
			render :new
		end	
		# rescue BCrypt::Errors::InvalidHash
		#   flash[:error] = 'We recently adjusted the way our passwords are stored. Please click the "forgot username or password?" link to re-establish your password. Thank you for your understanding!'
		#   redirect_to password_resets_url
		# end 
	end

	def destroy
		current_employer
		session.delete(:employer_id) || cookies.delete(:auth_token)
		redirect_to root_url, notice: "You have signed out!"
		# if session[:candidate_id] = nil || session[:employer_id] = nil
	 #  end
	end
end
