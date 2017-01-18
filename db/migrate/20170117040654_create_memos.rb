class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
    	t.string :description
    	t.datetime :created_at
    	t.datetime :updated_at
    	t.integer :user_id
    end
  end
end
