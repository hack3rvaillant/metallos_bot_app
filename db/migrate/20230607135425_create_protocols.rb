class CreateProtocols < ActiveRecord::Migration[7.0]
  def change
    create_table :protocols do |t|
      t.string :title
      t.text :content
      t.timestamp :start_at
      t.timestamp :end_at
      t.string :status, default: "draft"
      t.string :temporality
      t.string :place
      t.string :address_of_event
      t.timestamp :datetime_of_event
      t.string :url_of_event
      t.string :participation_type
      t.integer :duration_in_minutes
      t.references :artist, null: false, foreign_key: true
      t.references :org, null: false, foreign_key: true
      t.boolean :copyright_cleared, default: false
      t.boolean :bot_visible, default: false
      t.text :bot_intro
      t.text :bot_steps
      t.text :props_needed
      t.string :bot_cta
      t.text :bot_outro
      t.string :telegram_conversation_url

      t.timestamps
    end
  end
end
