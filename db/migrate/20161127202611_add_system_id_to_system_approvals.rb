class AddSystemIdToSystemApprovals < ActiveRecord::Migration
  def change
    add_column :system_approvals, :system_id, :integer
  end
end
