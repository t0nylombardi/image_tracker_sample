class AddAccessPathToCrawlers < ActiveRecord::Migration
  def change
    add_column :crawlers, :access_path, :string, after: :ip_address
  end
end
