class MakeRouterEquipment < ActiveRecord::Migration
  def change

    remove_column :routers, :network, :string
    add_column :routers, :test_id, :integer

    remove_column :tests, :router_id, :integer
    add_column :tests, :network_id, :integer

  end
end
