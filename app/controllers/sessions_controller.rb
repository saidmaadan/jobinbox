class SessionsController < ApplicationController
	def new
	end

	def create
		# if  @candidate = Candidate.from_omniauth(request.env['omniauth.auth'])
	 #    session[:candidate_id] = @candidate.id
	 #    redirect_to edit_candidate_path
  #     #flash[:success] = "Welcome, #{@candidate.name}!"
  #    end
		if employer = Employer.authenticate(params[:email_address], params[:password])
			# session[:employer_id] = employer.id
			if params[:remember_me]
        cookies.permanent[:auth_token] = employer.auth_token
      else
        cookies[:auth_token] = employer.auth_token
      end
			flash[:notice] = "Welcome back, #{employer.name}!"
			redirect_to(session[:intended_url] || employer)
			session[:intended_url] = nil
		elsif
			candidate = Candidate.authenticate(params[:email_address], params[:password])
			# session[:candidate_id] = candidate.id
			if params[:remember_me]
        cookies.permanent[:auth_token] = candidate.auth_token
      else
        cookies[:auth_token] = candidate.auth_token
      end
			flash[:notice] = "Welcome back, #{candidate.name}!"
			redirect_to(session[:intended_url] || candidate)
			session[:intended_url] = nil
		else
			flash.now[:alert] = "Invalid email/password combination!"
			render :new
		end	
	end

	def destroy
		if current_candidate
			session.delete(:candidate_id) || cookies.delete(:auth_token)
		end
		redirect_to root_url, notice: "You have signed out!"
		# if session[:candidate_id] = nil || session[:employer_id] = nil
	 #  end
	end
end
