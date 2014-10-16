class Customer < ActiveRecord::Base
  belongs_to :business

  def name
  	"#{first_name} #{last_name}".to_s
  end

end
