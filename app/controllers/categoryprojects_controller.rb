class CategoryprojectsController < InheritedResources::Base

  private

    def categoryproject_params
      params.require(:projectcontrol).permit(:categoryprojectstring, :categoryprojectorder)
    end

end
