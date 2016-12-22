class AddingUnique < ActiveRecord::Migration
  def change
    remove_column :encrypters, :serialNum
    add_column    :encrypters, :serialNum, :string , unique: true
  end
end
