class CreateSystemApprovals < ActiveRecord::Migration
  def change
    create_table :system_approvals do |t|

      t.timestamps null: false
    end
  end
end
