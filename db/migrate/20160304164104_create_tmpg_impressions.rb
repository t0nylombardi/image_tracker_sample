class CreateTmpgImpressions < ActiveRecord::Migration
  def change
    create_table :tmpg_impressions do |t|
      t.string :uniq_id
      t.string :ip_address
      t.string :campaign
      t.string :station

      t.timestamps null: false
    end
  end
end
