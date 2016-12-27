class AddActivityIdToPositions < ActiveRecord::Migration[5.0]
  def change
  	add_column :positions, :activity_id, :integer
  end
end
