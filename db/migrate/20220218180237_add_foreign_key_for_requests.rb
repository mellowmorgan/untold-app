class AddForeignKeyForRequests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :requests, :users
  end
end
