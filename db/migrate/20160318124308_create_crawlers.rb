class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :ip_address
      t.string :referral
      t.string :browser_type
      t.boolean :is_it_a_bot
      t.date :created_at

      t.timestamps null: false
    end
  end
end
