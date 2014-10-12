class CustomersController < ApplicationController
	before_action :get_business_and_owner

	def new
		@customer = Customer.new
	end

	private

			def get_business_and_owner
				@business = Business.find(params[:business_id])
				@owner = @business.owner
			end

end
