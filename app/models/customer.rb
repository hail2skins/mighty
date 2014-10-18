class Customer < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :business

  has_many :phones, as: :phoneable, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  def name
  	"#{first_name} #{last_name}".to_s
  end

end
