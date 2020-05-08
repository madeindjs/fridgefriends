class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.string :status

      t.timestamps
    end
    add_foreign_key :relationships, :users, column: :friend_id
    add_index :relationships, :friend_id
  end
end
