class AddingUsersToTests < ActiveRecord::Migration
  def change

    add_column :tests, :system_id, :integer
    add_column :systems, :lab_id, :integer

  end
end
