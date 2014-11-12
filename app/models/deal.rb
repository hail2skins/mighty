class Deal < ActiveRecord::Base
  belongs_to :customer
  has_one :package, through: :business
end
