class CreateBotBroadcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :bot_broadcasts do |t|
      t.text :intro
      t.text :steps
      t.text :outro
      t.string :cta
      t.string :telegram_conversation_url
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :broadcasted_at
      t.references :protocol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
