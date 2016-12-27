class AddTimestapsToEstimations < ActiveRecord::Migration[5.0]
  def change
  	add_column :estimations, :created_at, :datetime
  	add_column :estimations, :updated_at, :datetime
  end
end
