class DropUpdatedAtFromTmpgImpressions < ActiveRecord::Migration
  def change
    remove_column :tmpg_impressions, :updated_at, :date
  end
end
