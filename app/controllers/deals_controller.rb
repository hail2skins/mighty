class DealsController < ApplicationController
  before_action :get_customer_business_and_owner

  def index
  end

  def new
    @deal = @customer.deals.build
  end

  def create
    @deal = @customer.deals.new(deal_params)
 
    respond_to do |format|
      if @deal.save
        set_package_and_update
        format.html { redirect_to [@business, @customer], notice: "Package purchased for " + @customer.name }
      else
        format.html { render action: 'new' }
      end
    end
  end
    
    
    

  
  private
      def deal_params
        params.require(:deal).permit(:date_purchased, :date_completed, :used_count, :customer_id, :package_id)
      end
      
      def get_customer_business_and_owner
        @customer = Customer.find(params[:customer_id])
        @business = @customer.business
        @owner = @business.owner
      end
      
      def set_package_and_update
        @package = @deal.package
        @deal.update_attribute(:used_count, @package.count)
        @deal.update_attribute(:business_id, @business.id)
      end
      
end
