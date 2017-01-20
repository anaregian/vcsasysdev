class ModifyReceivedAtColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :incomes, :received_at, :date
  end
end
