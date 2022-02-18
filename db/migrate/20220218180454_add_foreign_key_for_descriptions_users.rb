class AddForeignKeyForDescriptionsUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :descriptions, :users
  end
end
