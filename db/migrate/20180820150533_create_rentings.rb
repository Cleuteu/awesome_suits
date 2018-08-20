class CreateRentings < ActiveRecord::Migration[5.2]
  def change
    create_table :rentings do |t|
      t.references :user, foreign_key: true
      t.references :suit, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
