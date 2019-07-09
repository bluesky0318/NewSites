class Status < ApplicationRecord
  	has_many    :projectcontrols
  	has_many    :issueboards
	def display_name 
		statusstring #the attribute on the has_many model
	end
end
