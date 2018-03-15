class AddAuthtypeFingerprintIdpToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :authentication_type, :integer
    add_column :customers, :fingerprint, :string
    add_column :customers, :idp_login, :string
  end
end
