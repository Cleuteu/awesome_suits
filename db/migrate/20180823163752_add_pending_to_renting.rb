class AddPendingToRenting < ActiveRecord::Migration[5.2]
  def change
    add_column :rentings, :pending, :boolean, default: true
  end
end
