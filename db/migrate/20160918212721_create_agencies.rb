class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.date :founded_date

      t.timestamps null: false
    end
  end
end
