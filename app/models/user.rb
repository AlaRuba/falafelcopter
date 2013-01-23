class User < ActiveRecord::Base
  attr_accessible :password, :username


	def self.authenticate(username_or_email="", login_password="")
		user = User.find_by_username(username_or_email)

		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end   

	def match_password(login_password="")
		logger.info("password" + Digest::SHA1.hexdigest(login_password))
		logger.info("password" + self.password)
		self.password.eql?(Digest::SHA1.hexdigest(login_password))
	end
end
