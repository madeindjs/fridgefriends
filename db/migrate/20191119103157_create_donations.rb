class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :giver, foreign_key: {to_table: :users}
      t.references :receiver, foreign_key: {to_table: :users}
      t.string :photo
      t.date :deadline
      t.string :status
      t.boolean :pick_up

      t.timestamps
    end
  end
end
