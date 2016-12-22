class FixAccrediationType < ActiveRecord::Migration
  def change
    remove_column :labs, :accrediation
    add_attachment :labs, :accrediation
  end
end
