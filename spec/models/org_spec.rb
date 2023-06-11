# == Schema Information
#
# Table name: orgs
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Org, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should have_many(:users) }
    it { should have_many(:protocols) }

    describe "active_bot_broadcast" do # One org can only have one bot_broadcast at a time
      let(:org) { create(:org) }
      let(:protocol) {create(:protocol, org: org)}
      let!(:active_bot_broadcast) { create(:bot_broadcast, protocol: protocol, start_at: 2.days.ago, end_at: 2.days.from_now) }
      let!(:past_protocol) { create(:bot_broadcast, protocol: protocol, start_at: 6.days.ago, end_at: 5.days.ago) }
      let!(:future_protocol) { create(:bot_broadcast, protocol: protocol, start_at: 3.days.from_now, end_at: 4.days.from_now) }

      it "returns only the active bot_broadcast" do
        expect(org.active_bot_broadcast).to eq active_bot_broadcast
      end
    end
  end
end
