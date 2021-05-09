class Comment < ApplicationRecord
  belongs_to :author, class_name: ""
  belongs_to :photo
end
