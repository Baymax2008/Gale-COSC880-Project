class AddPdfToTests < ActiveRecord::Migration
  def change

    remove_column :tests, :testNum
    remove_column :tests, :allLabMoA
    remove_column :tests, :testProcedures

    add_attachment :tests, :allLabMoA
    add_attachment :tests, :testProcedures
  end
end
