# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  ended_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :string
#
class Conversation < ApplicationRecord
  # Validations
  validates :chat_id, presence: true
end
