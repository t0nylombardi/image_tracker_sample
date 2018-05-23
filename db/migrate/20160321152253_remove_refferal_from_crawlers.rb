class RemoveRefferalFromCrawlers < ActiveRecord::Migration
  def change
    remove_column :crawlers, :referral
  end
end
