class TestBulkMailer < ApplicationMailer
  default from: 'support@hamcois.com'
  
  def bulk_email(customer)
    @customer = customer

    mail(to: @customer.email, subject: "No idea")
  end
end
