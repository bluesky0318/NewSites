class CategoryfilesController < InheritedResources::Base

  private

    def categoryfile_params
      params.require(:categoryfile).permit(:categoryfilestring, :categoryfileorder)
    end

end
