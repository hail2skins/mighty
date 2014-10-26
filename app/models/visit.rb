class Visit < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :customer_id
  validates_presence_of :date_of_visit
  #validates :date_of_visit, date: true   NOT NEEDED as field itself validates well.  I think.
end
