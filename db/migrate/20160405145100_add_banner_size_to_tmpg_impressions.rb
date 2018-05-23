class AddBannerSizeToTmpgImpressions < ActiveRecord::Migration
  def change
    add_column :tmpg_impressions, :banner_size, :string
  end
end
