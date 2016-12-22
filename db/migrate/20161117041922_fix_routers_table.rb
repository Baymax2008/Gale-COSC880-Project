class FixRoutersTable < ActiveRecord::Migration
  def change

    remove_column :routers, :Num_Ports, :integer
    add_column :routers, :numPorts, :integer
    remove_column :routers, :Network, :string
    add_column :routers, :network, :string

  end
end
