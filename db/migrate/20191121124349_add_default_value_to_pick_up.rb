class AddDefaultValueToPickUp < ActiveRecord::Migration[5.2]
  def change
    change_column :donations, :pick_up, :boolean, default: false
  end
end
