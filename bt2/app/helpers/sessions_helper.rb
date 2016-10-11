module SessionsHelper
	def current_user
		@current_user || User.find(session[:user_id]) if session[:user_id]
	end
	def logout
		session[:user_id] = nil
		self.current_user = nil
	end
end
