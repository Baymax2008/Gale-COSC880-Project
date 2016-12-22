class RemoveNetworkTests < ActiveRecord::Migration
  def change
    remove_column :tests, :network, :string
  end
end
