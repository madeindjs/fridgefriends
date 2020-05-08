class ChangeTextToStringDonations < ActiveRecord::Migration[5.2]
  def change
    change_column :donations, :description, :string
  end
end
