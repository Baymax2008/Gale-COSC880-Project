class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :Approved
      t.string :AllLabMoA
      t.string :Test_Procedures
      t.string :network
      t.string :testNum

      t.timestamps null: false
    end
  end
end
