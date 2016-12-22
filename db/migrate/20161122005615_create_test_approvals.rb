class CreateTestApprovals < ActiveRecord::Migration
  def change
    create_table :test_approvals do |t|
      t.boolean :approved
      t.integer :test_id

      t.timestamps null: false
    end

    remove_column :tests, :approved, :boolean
  end
end
