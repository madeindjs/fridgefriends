class ChangePhoneNumberToUsers < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :phone_number, :integer, using: 'phone_number::integer'
  end
end
