class AddAttributesToTmpgImpressions < ActiveRecord::Migration
  def change
    add_column :tmpg_impressions, :user_agent, :string
    add_column :tmpg_impressions, :referral, :string
  end
end
