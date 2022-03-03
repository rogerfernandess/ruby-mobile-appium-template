class LoginPages
	
	def home
		HomePage.new
	end

	def login
		LoginPage.new
	end

	def cadastrar
		CadastrarPage.new
	end

	def token
		TokenPage.new
	end

	def organizadorHome
		OrganizadorHome.new
	end
end
