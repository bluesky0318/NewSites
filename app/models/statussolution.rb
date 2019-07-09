class Statussolution < ApplicationRecord
	has_many    :projectcontrols
	def display_name 
		solutionstring #the attribute on the has_many model
	end
end
