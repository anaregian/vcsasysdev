class AddActivityIdToComponents < ActiveRecord::Migration[5.0]
  def change
  	add_column :components, :activity_id, :integer
  	add_column :components, :created_at, :datetime
  	add_column :components, :updated_at, :datetime
  end
end
