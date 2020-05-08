class AddDefaultValueToRelationshipsAndDonations < ActiveRecord::Migration[5.2]
  def change
    change_column :relationships, :status, :string, :default => "pending"
    change_column :donations, :status, :string, :default => "pending"
  end
end
