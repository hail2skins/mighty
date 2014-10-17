class Customer < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :business

  def name
  	"#{first_name} #{last_name}".to_s
  end

end
