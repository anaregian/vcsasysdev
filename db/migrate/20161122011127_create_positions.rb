class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
    	t.string :name
    	t.decimal :allocated_money
    	t.datetime :created_at
    	t.datetime :updated_at
    end
  end
end
