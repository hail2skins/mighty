class Price < ActiveRecord::Base
  belongs_to :cost, polymorphic: true
  
  validates_presence_of :amount
end