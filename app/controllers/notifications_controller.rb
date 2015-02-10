class NotificationsController < ApplicationController
  before_action :get_business_and_owner
  
  
  def new
    @notification = @business.notifications.build
  end
  
  def create
    @notification = @business.notifications.new(notification_params)
    
    respond_to do |format|
      if @notification.save
        send_bulk_email
        format.html { redirect_to [@owner, @business], notice: 'Notification sent to selected customers.' }
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
      
      def notification_params
        params.require(:notification).permit(:subject, :body, :business_id)
      end
      
	    def send_bulk_email
		    @business.customers.each do |customer|
			   TestBulkMailer.bulk_email(customer).deliver_later unless customer.email == ""
	      end
      end      
  
end
