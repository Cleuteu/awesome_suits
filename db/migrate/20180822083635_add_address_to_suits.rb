class AddAddressToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :address, :string
  end
end
