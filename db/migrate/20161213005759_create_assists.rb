class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.belongs_to :test, index: true
      t.belongs_to :lab, index: true

      t.timestamps null: false
    end
  end
end