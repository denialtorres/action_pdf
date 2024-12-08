class AddAddressToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :jsonb, default: {}, null: false
  end
end
