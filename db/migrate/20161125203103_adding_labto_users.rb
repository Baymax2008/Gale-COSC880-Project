class AddingLabtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :lab_id, :integer
  end
end
