class AddIndexesToRequests < ActiveRecord::Migration[6.1]
  def change
    add_index :requests, :id
    add_index :requests, :status
  end
end
