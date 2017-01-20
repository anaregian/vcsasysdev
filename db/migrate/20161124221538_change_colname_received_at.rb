class ChangeColnameReceivedAt < ActiveRecord::Migration[5.0]
  def change
  	rename_column :incomes, :received_at, :date
  end
end
