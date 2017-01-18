class AddPasswordResetToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password_reset_token
    remove_column :users, :password_reset_sent_at
  end
end
