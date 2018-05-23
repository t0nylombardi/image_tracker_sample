class ChangeTableBannerToPixels < ActiveRecord::Migration
  def change
    rename_table :pixel, :pixels
  end
end
