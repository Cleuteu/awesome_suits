class CreateSmokings < ActiveRecord::Migration[5.2]
  def change
    create_table :smokings do |t|
      t.string :color
      t.text :description
      t.string :style
      t.string :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
