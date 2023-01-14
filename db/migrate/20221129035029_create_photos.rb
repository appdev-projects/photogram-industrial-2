class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :comments_count, dafault: 0
      t.integer :likes_count, default: 0
      t.text :caption
      # "to_table: :users" added because "owners" is not the normal naming convention; supposed to be "user"
      t.references :owner, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
