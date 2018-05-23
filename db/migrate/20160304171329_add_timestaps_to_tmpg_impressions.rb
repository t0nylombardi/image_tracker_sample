class AddTimestapsToTmpgImpressions < ActiveRecord::Migration
  def change_table
    add_column(:tmpg_impressions, :created_at, :datetime)
    add_column(:tmpg_impressions, :updated_at, :datetime)
  end
end
