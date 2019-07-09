class OsplatformsController < ApplicationController::Base
	def index
		@osplatforms = Osplatform.order("id").all
	end

	#def show
	#@osplatform = Osplatform.find(params[:id])
	#end

	def new
		@osplatform = Osplatform.new
		@categoryprojects = Categoryproject.order("id").all
	end

	def create
		@osplatform = Osplatform.new(osplatform_params)
		if @osplatform.save
			redirect_to osplatforms_path
		else
			redirect_to new_osplatform_path
		end
	end

	def edit
		@osplatform = Osplatform.find(params[:id])
		@categoryprojects = Categoryproject.order("id").all
	end

	def update
		@osplatform = Osplatform.find(params[:id])
		if @osplatform != nil
			if @osplatform.update_attributes(osplatform_params)
				redirect_to osplatforms_path
			else
				redirect_to edit_osplatform_path
			end
		end
	end

	def destroy
		@osplatform = Osplatform.find(params[:id])
		@osplatform.destroy
		redirect_to osplatforms_path
	end


	private
	def osplatform_params
		params.require(:osplatform).permit(:categoryproject_id, :osdescribe, :osorder)
	end
end
