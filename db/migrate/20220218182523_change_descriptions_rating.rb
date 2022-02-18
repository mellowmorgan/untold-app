class ChangeDescriptionsRating < ActiveRecord::Migration[5.2]
  def change
    change_column :descriptions, :rating, :integer, default: 0
  end
end
