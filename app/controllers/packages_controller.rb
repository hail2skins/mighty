class PackagesController < ApplicationController
  
  before_action :get_business_and_owner
  
  def new
    @package = @business.packages.build
  end
  
  def create
    @package = @business.packages.new(package_params)
    
    respond_to do |format|
      if @package.save
        format.html { redirect_to [@owner, @business], notice: "Package added." }
      else
        format.html { render action: 'new' }
      end
    end
  end



  private
      def get_business_and_owner
        @business = Business.find(params[:business_id])
        @owner = @business.owner
      end
      
      def package_params
        params.require(:package).permit(:name, :description, :count, :date_purchased)
      end
end