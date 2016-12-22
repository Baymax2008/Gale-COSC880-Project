class AddingFalseToEmail < ActiveRecord::Migration
  def change
    remove_column :encrypters, :expirationEmail,     :boolean
    remove_column :labs,       :accredDateEmail,     :boolean
    remove_column :labs,       :loaExpirationEmail,  :boolean
    remove_column :systems,    :atoExpirationEmail,  :boolean
    remove_column :tests,      :stateEmail,          :boolean
    remove_column :tests,      :endEmail,            :boolean

    add_column :encrypters, :expirationEmail,     :boolean, default: false
    add_column :labs,       :accredDateEmail,     :boolean, default: false
    add_column :labs,       :loaExpirationEmail,  :boolean, default: false
    add_column :systems,    :atoExpirationEmail,  :boolean, default: false
    add_column :tests,      :stateEmail,          :boolean, default: false
    add_column :tests,      :endEmail,            :boolean, default: false
  end
end
