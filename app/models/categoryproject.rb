class Categoryproject < ApplicationRecord
	has_many    :projectcontrols
	def display_name 
		categoryprojectstring #the attribute on the has_many model
	end
end
