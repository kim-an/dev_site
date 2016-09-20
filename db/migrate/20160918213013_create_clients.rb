class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :business_name
      t.string :point_of_contact
      t.references :agency, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
