class ChangeTableBannerToPixel < ActiveRecord::Migration
  def change
    rename_table :banner, :pixels
  end
end
