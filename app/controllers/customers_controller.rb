class CustomersController < ApplicationController
	before_action :get_business_and_owner

	def new
		@customer = @business.customers.build
	end

	def create
		@customer = @business.customers.new(customer_params)

		respond_to do |format|
			if @business.save
				format.html { redirect_to owner_business_path(@owner, @business), notice: "Customer added." }
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

			def customer_params
				params.require(:customer).permit(:first_name, :middle_name, :last_name, :email, :phone, :referred_by)
			end

end
