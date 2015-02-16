class GiftCertificatesController < ApplicationController
  before_action :get_customer_business_and_owner
  before_action :set_gift_certificate, only: [ :show, :edit, :update, :destroy ]


  def new
    @gift_certificate = @customer.gift_certificates.build
    @gift_certificate.prices.build(params[:price])
    @gift_certificate.comments.build(params[:comment])
  end
  
  def create
    @gift_certificate = @customer.gift_certificates.new(gift_certificate_params)
    respond_to do |format|
      if @gift_certificate.save
        update_certificate_info
        
        
        format.html { redirect_to [@customer, @gift_certificate], notice: "Gift Certificate created." }
      else
        format.html { render action: 'new' }
      end
    end
  end 

  def show
  end
  
  def index
    @gift_certificates = @customer.gift_certificates.all
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @gift_certificate.update(gift_certificate_params)
        
        format.html { redirect_to [@owner, @business], notice: "Gift Certificate successfully edited." }
      else
        format.html { render action: 'new' }
      end
    end
  end
  


  



  private
 
      def set_gift_certificate
        @gift_certificate = @customer.gift_certificates.find(params[:id])
      end
  
      def get_customer_business_and_owner
        @customer = Customer.find(params[:customer_id])
        @business = @customer.business
        @owner = @business.owner
      end
      
      def gift_certificate_params
        params.require(:gift_certificate).permit(:customer_id, :active, :prices_attributes => [:id, :amount], :comments_attributes => [:id, :comment])
      end
      
      def update_certificate_info
        @gift_certificate.update_attribute(:business_id, @business.id)
        certificate_number = @business.gift_certificates.count
        @gift_certificate.update_attribute(:certificate_number, certificate_number)
      end

end