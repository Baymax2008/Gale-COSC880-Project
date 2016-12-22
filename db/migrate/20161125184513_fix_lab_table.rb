class FixLabTable < ActiveRecord::Migration
  def change

    remove_column :labs, :lab_Manager_id_id, :integer
    add_column  :labs, :mgr_id, :integer
  end
end
