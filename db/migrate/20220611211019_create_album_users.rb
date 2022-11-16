class CreateAlbumUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :album_users do |t|
      t.belongs_to :album
      t.belongs_to :user
      t.timestamps
    end
  end
end
