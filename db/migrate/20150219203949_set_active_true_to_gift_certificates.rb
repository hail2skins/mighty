class SetActiveTrueToGiftCertificates < ActiveRecord::Migration
  def up
    change_column :gift_certificates, :active, :boolean, default: true
  end

  def down
    change_column :gift_certificates, :active, :boolean, default: false
  end

end
