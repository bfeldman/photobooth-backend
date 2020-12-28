class AddPhotoIdsToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :photo_ids, :integer, array:true, default: []
  end
end
