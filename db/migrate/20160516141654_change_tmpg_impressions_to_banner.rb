class ChangeTmpgImpressionsToBanner < ActiveRecord::Migration
  def change
    rename_table :tmpg_impressions, :banner
  end


end
