class AddPasswordToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :password_digest, :string
  end
end
