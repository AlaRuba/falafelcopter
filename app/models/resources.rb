class Resources < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :instructions, :name, :phone1, :phone2, :phone3, :website, :zipcode, :answer_id
  acts_as_gmappable

	def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.address1} #{self.address2}, #{self.city}" 
	end
end
