class AddCoordinatesToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :latitude, :float
    add_column :suits, :longitude, :float
  end
end
