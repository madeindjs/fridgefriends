class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :donation, foreign_key: true
      t.text :product_name
      t.integer :product_quantity
      t.string :unit_of_measurement

      t.timestamps
    end
  end
end
