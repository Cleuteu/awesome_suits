class AddNameToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :name, :string
  end
end
