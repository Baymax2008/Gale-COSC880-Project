class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :classification
      t.string :pocName
      t.string :pocNumber
      t.date :experationDate

      t.timestamps null: false
    end
  end
end
