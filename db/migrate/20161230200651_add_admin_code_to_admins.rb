class AddAdminCodeToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_code, :string
  end
end
