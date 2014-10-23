class Customer < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :business

  has_many :visits
  accepts_nested_attributes_for :visits

  has_many :phones, as: :phoneable, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates_presence_of :first_name, :last_name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true


  def name
  	"#{first_name} #{last_name}".to_s
  end

end
