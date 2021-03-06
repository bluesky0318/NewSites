class ReleasecentersController < ApplicationController
	def new
	    @releasecenter = Releasecenter.new
	    @selectedprojects = Projectcontrol.includes(:categoryproject, :osplatform, :hwplatform, :status, :assignedto, :customerlist).where("status_id <> ?", 7).order("id")
	    collect_models_information
  	end

  	def collect_models_information
	    #@projectcontrols = Projectcontrol.includes(:categoryproject, :osplatform, :hwplatform, :status, :assignedto, :customerlist).order("id").all
	    #leon suggest that CLOSED project could not be show in selection
	    @projectcontrols = Projectcontrol.includes(:categoryproject, :osplatform, :hwplatform, :status, :assignedto, :customerlist).where("status_id <> 7").order("id")
	    @prjcategories = Categoryproject.order("categoryprojectorder").all
	    @osplatforms = Osplatform.order("osorder").all
	    @statuses = Status.where("statusissue = true").order("statusorder")
	    @statussolutions = Statussolution.order("solutionorder")
	    @hwplatforms = Hwplatform.order("hwcode").all
	    @customerlists = Customerlist.order("customerorder").all
	    @categoryfiles = Categoryfile.where("catefileissue = true").order("categoryfileorder")
	    @users = User.order("email").where('visible = ? AND role <> ?', "true", "user")
	    @bugreasons = Bugreason.order("bugorder").all
  	end
end
