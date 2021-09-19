class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end