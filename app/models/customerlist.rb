class Customerlist < ApplicationRecord	
  	has_many    :projectcontrols
  	has_many    :issueboards
  	has_many    :releasecenters
	def display_name 
		companyname #the attribute on the has_many model
	end
end
