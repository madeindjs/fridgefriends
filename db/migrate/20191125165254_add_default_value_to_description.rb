class AddDefaultValueToDescription < ActiveRecord::Migration[5.2]
  def change
    change_column :donations, :description, :string, default: "Je donne tout !"
  end
end
