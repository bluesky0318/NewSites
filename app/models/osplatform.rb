class Osplatform < ApplicationRecord
	has_many    :projectcontrols
	
	def display_name 
		osdescribe #the attribute on the has_many model
	end
end
