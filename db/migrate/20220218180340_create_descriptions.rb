class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.string :content
      t.string :status
      t.integer :user_id
      t.integer :rating
      t.integer :request_id
      t.timestamps()
    end
  end
end
