class SetCustomerDefault < ActiveRecord::Migration
  def change
    remove_column :users, :customer, :boolean
    add_column :users, :customer, :boolean, default: true
  end
end
