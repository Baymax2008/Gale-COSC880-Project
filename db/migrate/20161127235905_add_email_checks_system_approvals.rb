class AddEmailChecksSystemApprovals < ActiveRecord::Migration
  def change
    add_column :system_approvals, :atoEmail,  :boolean, default: false
    add_column :system_approvals, :aiEmail,   :boolean, default: false
  end
end
