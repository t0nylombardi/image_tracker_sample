class RemoveUniqIdFromTmpgImpressions < ActiveRecord::Migration
  def change
    remove_column :tmpg_impressions, :uniq_id, :string
  end
end
