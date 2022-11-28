class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :comments_count, default: 0 
      t.integer :likes_count, default: 0 
      t.text :caption
      #we need to specify that the table :owner is tied to the :users table.. so that way we can just use references instead of 
      # _id when we are useing foreingn_key values. Rails also gives us more tools whnen using references!!!
      # not doing so will cause the migration to fail
      t.references :owner, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
