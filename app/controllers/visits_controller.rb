class VisitsController < ApplicationController
  before_action :get_customer_business_and_owner
  before_action :set_visit, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @visits = @customer.visits.all
  end

  def new
    @visit = @customer.visits.build
  end

  def show
  end

  def create
    @visit = @customer.visits.new(visit_params)

    respond_to do |format|
      if @visit.save
        format.html { redirect_to [@owner, @business], notice: "Visit added for " + @customer.name }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to [@owner, @business], notice: "Visit successfully edited." }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to [@business, @customer], notice: 'Visit deleted.' }
    end  
  end
  


  private

      def set_visit
        @visit = @customer.visits.find(params[:id])
      end

      def visit_params
        params.require(:visit).permit(:visit_notes, :date_of_visit, :customer_id)
      end

      def get_customer_business_and_owner
        @customer = Customer.find(params[:customer_id])
        @business = @customer.business
        @owner = @business.owner
      end
end