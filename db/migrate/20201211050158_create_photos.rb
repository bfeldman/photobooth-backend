class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :is_public
      t.string :base64_src

      t.timestamps
    end
  end
end
