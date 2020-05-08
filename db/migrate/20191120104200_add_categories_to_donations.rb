class AddCategoriesToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :categories, :string, array: true, default: []
  end
end
