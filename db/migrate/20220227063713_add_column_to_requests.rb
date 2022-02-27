class AddColumnToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :categories, :string, array:true, default: []
  end
end
