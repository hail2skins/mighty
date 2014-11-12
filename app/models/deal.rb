class Deal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business
  has_one :package
  
  accepts_nested_attributes_for :package
  

end
