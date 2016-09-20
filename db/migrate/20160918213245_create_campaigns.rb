class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.date :launch_date
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
