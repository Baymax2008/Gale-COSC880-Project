class ChangeAccrediationToString < ActiveRecord::Migration
  def change
    remove_column :labs, :accrediation
    add_column    :labs, :accrediation, :string
  end
end
