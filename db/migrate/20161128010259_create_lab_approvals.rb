class CreateLabApprovals < ActiveRecord::Migration
  def change
    create_table :lab_approvals do |t|

      t.boolean  "approved", default: false
      t.integer  "lab_id"

      t.timestamps null: false
    end

    remove_column   :labs,  :loa_Approval
    remove_column   :labs,  :loa
    add_attachment  :labs,  :loa
  end
end
