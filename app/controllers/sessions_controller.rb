class SessionsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])
		errors = []

		if @user
			if @user.authenticate(params[:password])
				puts @user, "*" *20
				session[:user_id] = @user.id

				return redirect_to '/shoes'
			else
				errors << 'Invalid password'
			end
		else
			errors << 'No account with that email exists. Please register'
		end
		redirect_to :back, alert: errors
	end

	def destroy
		session[:user_id]=nil
		redirect_to '/main'
	end
end
