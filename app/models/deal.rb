class Deal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business
  belongs_to :package
  
  accepts_nested_attributes_for :package
  
  validates_presence_of :package_id
  

end
