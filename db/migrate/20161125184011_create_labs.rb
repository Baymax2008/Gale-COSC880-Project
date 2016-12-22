class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
      t.text :accrediation
      t.date :accredDate
      t.text :loa
      t.boolean :loa_Approval
      t.text :loa_Expiration
      t.references :lab_Manager_id

      t.timestamps null: false
    end
  end
end
