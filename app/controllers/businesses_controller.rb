class BusinessesController < ApplicationController
	before_action :get_owner
	before_action :set_business, only: [:show, :edit, :update, :destroy]
	load_and_authorize_resource :owner
	load_and_authorize_resource :business, through: :owner


	def new
		@business = @owner.businesses.build
	end

	def create
		@business = @owner.businesses.new(business_params)

		respond_to do |format|
			if @business.save
				format.html { redirect_to current_owner, notice: 'Congratulations.  Your business has been created.' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	def show
	end

	def edit
	end

	def update
  	respond_to do |format|
  		if @business.update(business_params)
  			format.html { redirect_to @owner, notice: "Your business information has been successfully updated." }
			else
				format.html { render action: 'edit' }
			end
		end
	end

	def destroy
		@business.destroy
		respond_to do |format|
			format.html { redirect_to @owner, notice: 'You have deleted this registered business.' }
		end
	end

	private

			def set_business
				@business = @owner.businesses.find(params[:id])
			end

			def business_params
				params.require(:business).permit(:name, :description)
			end

			def get_owner
				@owner = Owner.find(params[:owner_id])
			end

end