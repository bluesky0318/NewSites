class CustomerlistsController < InheritedResources::Base
	belongs_to :projectcontrl

  private

    def customerlist_params
      params.require(:customerlist).permit(:companyname, :engineeremail, :customerorder, :companydescription)
    end

end
