class RemoveActivityColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :positions, :activity_id
  	add_column :activities, :position_id, :integer
  end
end
