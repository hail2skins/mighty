class PurchasedPackage < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business
end
