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
require "rails_helper"

RSpec.describe Conversation, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:chat_id) }
  end
end
