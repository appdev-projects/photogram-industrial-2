class Like < ApplicationRecord
  belongs_to :fan,null: false, foreign_key: { to_table: :users }
  belongs_to :photo,null: false
end
