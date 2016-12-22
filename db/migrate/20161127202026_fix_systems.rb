class FixSystems < ActiveRecord::Migration
  def change

    #remove
    remove_column :systems, :ia_Approval
    remove_column :systems, :ato_Approval
    remove_column :systems, :ato_Doc

    #add
    add_column      :system_approvals, :iaApproved,  :boolean
    add_column      :system_approvals, :atoApproved, :boolean
    add_attachment  :systems,          :atoDoc

  end
end
