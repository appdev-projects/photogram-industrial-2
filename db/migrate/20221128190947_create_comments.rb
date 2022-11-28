class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      # remember... CONVENTION OVER EVERYHTING
      # our foreign_key cannot be true because author is not a table

      # t.references :author, null: false, foreign_key: true

      t.references :author, null: false, foreign_key: {to_table: :users}
      t.references :photo, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
