class AddDefaultToPrivate < ActiveRecord::Migration[6.1]
  def change
    #only for adding and removing columns can you expect the migration to do most of the work... we are setting a default so we need to write the code!!!
    change_column_default(
      :users,
      :private,
      true
    )
  end
end
