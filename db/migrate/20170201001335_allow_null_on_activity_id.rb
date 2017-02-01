class AllowNullOnActivityId < ActiveRecord::Migration[5.0]
  def change
    change_column :components, :activity_id, :integer, :null => true
  end
end
