class CreatePurchasedPackages < ActiveRecord::Migration
  def change
    create_table :purchased_packages do |t|
      t.references :customer, index: true
      t.references :business, index: true
      t.date :date_purchased
      t.date :date_completed
      t.integer :used_count

      t.timestamps
    end
  end
end
