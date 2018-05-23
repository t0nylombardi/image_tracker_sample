class CreateClickEvents < ActiveRecord::Migration
  def change
    create_table :click_events do |t|
      t.string :ip_address
      t.string :campaign
      t.string :banner_size
      t.string :station
      t.string :city
      t.string :state
      t.string :user_agent
      t.string :referral
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
