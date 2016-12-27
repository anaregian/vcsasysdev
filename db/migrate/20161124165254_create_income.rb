class CreateIncome < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
    	t.string :description
    	t.decimal :amount
    	t.datetime :received_at
    	t.datetime :created_at
    	t.datetime :updated_at
    end
  end
end
