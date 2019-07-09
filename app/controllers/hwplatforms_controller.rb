class HwplatformsController < InheritedResources::Base
	belongs_to :projectcontrl

  private
    def hwplatform_params
      params.require(:hwplatform).permit(:hwnickname, :hwcode, :hwmajorversion, :hwminorversion, :hworder, :hwdescription)
    end

end
