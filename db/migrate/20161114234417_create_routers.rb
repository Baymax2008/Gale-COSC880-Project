class CreateRouters < ActiveRecord::Migration
  def change
    create_table :routers do |t|
      t.integer :Num_Ports
      t.string :Network
      t.string :serialNum
      t.text :description

      t.timestamps null: false
    end
  end
end
