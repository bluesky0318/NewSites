class ProjectcontrolsController < ApplicationController
  private
	def projectcontrol_params
		params.require(:projectcontrol).permit(:projectname, :projectcode, :categoryproject_id, :osplatform_id, 
			:hwplatform_id, :customerlist_id, :assignedto_id, :reporter_id, :status_id, :statussolution_id, 
			:projectrefer_id, :prjdescription, :cclist => [])
	end
end	
