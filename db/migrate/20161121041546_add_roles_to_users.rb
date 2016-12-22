class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :ia_admin, :boolean, default: false
    add_column :users, :it_admin, :boolean, default: false
    add_column :users, :customer, :boolean, default: false
  end
end
