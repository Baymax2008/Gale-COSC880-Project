class FixTestTable < ActiveRecord::Migration
  def change
    remove_column :tests, :Approved, :boolean
    add_column :tests, :approved, :boolean

    remove_column :tests, :AllLabMoA, :string
    add_column :tests, :allLabMoA, :string

    remove_column :tests, :Test_Procedures, :string
    add_column :tests, :testProcedures, :string

  end
end
