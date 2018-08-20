class AddPhotoToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :photo, :string
  end
end
