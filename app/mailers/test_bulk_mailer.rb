class TestBulkMailer < ApplicationMailer
  default from: 'support@hamcois.com'
  
  def bulk_email(customer, msgsubject)
    @customer = customer


    mail(to: @customer.email, subject: msgsubject)
  end
end
