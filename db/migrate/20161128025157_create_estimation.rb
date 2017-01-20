class CreateEstimation < ActiveRecord::Migration[5.0]
  def change
    create_table :estimations do |t|
    	t.decimal :estimate
    end
  end
end
