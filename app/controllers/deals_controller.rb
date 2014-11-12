class DealsController < ApplicationController
  before_action :get_customer_business_and_owner
  
  
  def index
  end

  def new
    @deal = @customer.deals.new

  end

  def create
  end
  
  private
      def visit_params
        params.require(:deals).permit(:date_purchased, :date_completed, :used_count)
      end
      
      def get_customer_business_and_owner
        @customer = Customer.find(params[:customer_id])
        @business = @customer.business
        @owner = @business.owner
      end
end
