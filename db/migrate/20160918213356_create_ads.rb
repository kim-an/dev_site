class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :html_file
      t.integer :width
      t.integer :height
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
