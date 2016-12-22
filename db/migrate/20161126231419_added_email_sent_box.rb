class AddedEmailSentBox < ActiveRecord::Migration
  def change
    add_column :encrypters, :expirationEmail, :boolean
    add_column :labs, :accredDateEmail, :boolean
    add_column :labs, :loaExpirationEmail,:boolean
    remove_column :labs, :loa_Expiration, :text
    add_column :labs, :loa_Expiration, :date
    add_column :systems, :atoExpirationEmail, :boolean
    add_column :tests, :stateEmail, :boolean
    add_column :tests, :endEmail, :boolean
  end
end
