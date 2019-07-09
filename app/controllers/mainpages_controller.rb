class MainpagesController < ApplicationController
	before_filter :authenticate_user!
	def index
		@bannerarr = ""
	end
end
