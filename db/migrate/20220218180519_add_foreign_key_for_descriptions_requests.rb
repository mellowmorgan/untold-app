class AddForeignKeyForDescriptionsRequests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :descriptions, :requests
  end
end
