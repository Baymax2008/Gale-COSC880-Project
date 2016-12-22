class CreateEncrypters < ActiveRecord::Migration
  def change
    create_table :encrypters do |t|
      t.string :serialNum
      t.text :description
      t.integer :speed
      t.date :expiration
      t.references :test

      t.timestamps null: false
    end
  end
end
