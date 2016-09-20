class ChangeNameToBusinessNameInAgencyTable < ActiveRecord::Migration
  def change
    rename_column :agencies, :name, :business_name
  end
end
