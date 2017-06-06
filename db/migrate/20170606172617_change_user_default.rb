class ChangeUserDefault < ActiveRecord::Migration[5.0]
  def change
      change_column :users, :email_confirmed, :boolean, :default => true
  end
end
