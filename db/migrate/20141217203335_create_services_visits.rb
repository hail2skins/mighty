class CreateServicesVisits < ActiveRecord::Migration
  def change
    create_table :services_visits do |t|
      t.belongs_to :service
      t.belongs_to :visit
    end
  end
end
