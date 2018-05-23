class CreateIndexForPixels < ActiveRecord::Migration
  def change
    add_index :pixels, :id, name: 'pixels_id_ix'
  end
end
