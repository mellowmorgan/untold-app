class ChangeDescriptionsStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :descriptions, :status, :string, default:"submitted"
  end
end
