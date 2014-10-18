class Phone < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true

  validates :number, numericality: { only_integer: true }, length: { is: 10 }, allow_blank: true
end