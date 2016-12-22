class FixingTestStartEmail < ActiveRecord::Migration
  def change
    remove_column :tests, :stateEmail,  :boolean, default: false
    add_column    :tests, :startEmail,  :boolean, default: false
  end
end
