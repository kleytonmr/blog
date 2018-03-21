module SessionsHelper
	# logs do usuário fornecido
	def log_in(user)
		session[:user_id] = user.id
	end

	# Retorna o usuário conectado atual (se houver).
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Retorna true se o usuário estiver logado, falso caso contrário. 
	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		current_user = nil
		
	end
end
