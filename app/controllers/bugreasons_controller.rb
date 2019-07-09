class BugreasonsController < InheritedResources::Base

  private

    def bugreason_params
      params.require(:bugreason).permit(:bugdescriptionstring, :bugorder)
    end

end
