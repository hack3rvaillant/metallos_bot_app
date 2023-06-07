class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :chat_id
      t.timestamp :ended_at

      t.timestamps
    end
  end
end
