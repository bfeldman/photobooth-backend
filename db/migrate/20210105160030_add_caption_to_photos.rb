class AddCaptionToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :caption, :string
  end
end
