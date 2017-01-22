class AddAdminCodeTable < ActiveRecord::Migration[5.0]
  def change
  	    create_table :admin_code do |t|
    	t.string :admin_code
    end
  end
end
