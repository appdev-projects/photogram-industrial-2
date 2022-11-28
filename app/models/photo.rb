class Photo < ApplicationRecord
  # cool... because we used refrences we had an association already defined for us once we migrated the code
  # remember if we go agianst convention we need to include class_name: "User" ... we chose ot call our foreign key owner instead of user
  belongs_to :owner, class_name: "User"
end
