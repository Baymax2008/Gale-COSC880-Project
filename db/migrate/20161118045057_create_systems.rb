class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.boolean :ia_Approval
      t.boolean :ato_Approval
      t.date :ato_Expiration
      t.text :ato_Doc

      t.timestamps null: false
    end
  end
end
