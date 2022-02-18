class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :content
      t.string :status
      t.integer :user_id
      t.timestamps()
    end
  end
end
