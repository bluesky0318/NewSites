class Hwplatform < ApplicationRecord
	has_many    :projectcontrols
	def display_name 
		hwnickname #the attribute on the has_many model
	end
end
