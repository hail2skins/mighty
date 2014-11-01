class Package < ActiveRecord::Base
  belongs_to :business
  
  validates_presence_of :name, message: "Package Name can't be blank."
  validates_presence_of :count, presence: true, message: "Number of visits in package can't be blank."
end
