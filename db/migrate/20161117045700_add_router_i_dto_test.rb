class AddRouterIDtoTest < ActiveRecord::Migration
  def change

    add_column :tests, :router_id, :integer

  end
end
