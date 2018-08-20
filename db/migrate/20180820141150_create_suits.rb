class CreateSuits < ActiveRecord::Migration[5.2]
  def change
    create_table :suits do |t|
      t.references :user, foreign_key: true
      t.string :color
      t.text :description
      t.string :style
      t.string :size
      t.integer :price_per_day

      t.timestamps
    end
  end
end
