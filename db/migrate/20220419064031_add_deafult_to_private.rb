class AddDeafultToPrivate < ActiveRecord::Migration[6.1]
  def change
    change_column_default(
      :follow_requests,
      :status,
      "Pending"
    )
  end
end
