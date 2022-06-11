class CreateAlbumUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :album_users do |t|

      t.timestamps
    end
  end
end
