class AddAddressToTmpgImpressions < ActiveRecord::Migration
  def change
    add_column :tmpg_impressions, :city, :string
    add_column :tmpg_impressions, :state, :string
  end
end
