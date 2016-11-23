class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
    	t.string :component_name
    	t.string :description
    	t.decimal :cost
    end
  end
end
