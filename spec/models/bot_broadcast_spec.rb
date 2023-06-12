# == Schema Information
#
# Table name: bot_broadcasts
#
#  id                        :bigint           not null, primary key
#  broadcasted_at            :datetime
#  cta                       :string
#  end_at                    :datetime
#  intro                     :text
#  outro                     :text
#  start_at                  :datetime
#  steps                     :text
#  telegram_conversation_url :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  protocol_id               :bigint           not null
#
# Indexes
#
#  index_bot_broadcasts_on_protocol_id  (protocol_id)
#
# Foreign Keys
#
#  fk_rails_...  (protocol_id => protocols.id)
#
require 'rails_helper'

RSpec.describe BotBroadcast, type: :model do
  context "Validations" do
    it { should validate_presence_of(:intro) }
    it { should validate_presence_of(:steps) }
    it { should validate_presence_of(:outro) }
    it { should validate_presence_of(:cta) }
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
    it { should validate_presence_of(:telegram_conversation_url) }
  end

  describe "Only one active bot_broadcast at a time" do
    let(:bot_broadcast) { build(:bot_broadcast, start_at: 3.days.from_now, end_at: 5.days.from_now) }
    subject { bot_broadcast.valid? }

    context "when there is a bot_broadcast overlap" do
      let(:bot_broadcast) { build(:bot_broadcast, start_at: 3.days.from_now, end_at: 5.days.from_now) }

      context "when the bot_broadcast ends during another bot_broadcast" do
        let!(:existing_bot_broadcast) { create(:bot_broadcast, start_at: 4.days.from_now, end_at: 6.days.from_now) }

        it "the bot_broadcast is invalid" do
          expect(subject).to be false
        end
      end

      context "when the bot_broadcast start during another bot_broadcast" do
        let!(:existing_bot_broadcast) { create(:bot_broadcast, start_at: 2.days.from_now, end_at: 4.days.from_now) }

        it "the bot_broadcast is invalid" do
          expect(subject).to be false
        end
      end

      context "when the bot_broadcast start and ends during another bot_broadcast" do
        let!(:existing_bot_broadcast) { create(:bot_broadcast, start_at: 2.days.from_now, end_at: 6.days.from_now) }

        it "the bot_broadcast is invalid" do
          expect(subject).to be false
        end
      end
    end

    context "when there is no bot_broadcast overlap" do
      context "when bot_broadcast is happening before existing bot_broadcast" do
        let!(:existing_bot_broadcast) { create(:bot_broadcast, start_at: 8.days.from_now, end_at: 10.days.from_now) }
        it "is valid" do
          expect(subject).to be true
        end
      end

      context "when bot_broadcast is happening after existing bot_broadcast" do
        let!(:existing_bot_broadcast) { create(:bot_broadcast, start_at: 1.days.from_now, end_at: 2.days.from_now) }
        it "is valid" do
            expect(subject).to be true
        end
      end
    end
  end
end
