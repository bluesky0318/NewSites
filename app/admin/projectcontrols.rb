ActiveAdmin.register Projectcontrol do
	permit_params :projectname, :projectcode, :categoryproject_id, :osplatform_id, 
			:hwplatform_id, :customerlist_id, :assignedto_id, :reporter_id, :status_id, :statussolution_id, 
			:projectrefer_id, :prjdescription, :cclist => []
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
