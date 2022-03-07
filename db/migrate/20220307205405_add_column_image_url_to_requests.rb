class AddColumnImageUrlToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :image_url, :string
  end
end
