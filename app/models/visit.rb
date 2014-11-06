# == Schema Information
#
# Table name: visits
#
#  id            :integer          not null, primary key
#  visit_notes   :text
#  date_of_visit :date
#  customer_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  business_id   :integer
#

class Visit < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :customer_id
  validates_presence_of :date_of_visit
  #validates :date_of_visit, date: true   NOT NEEDED as field itself validates well.  I think.
end
