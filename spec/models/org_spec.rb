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
    it { should have_one(:active_protocol) }

    describe "active_protocol" do
      let(:org) { create(:org) }
      let!(:active_protocol) { create(:protocol, org: org, start_at: 2.days.ago, end_at: 2.days.from_now) }
      let!(:past_protocol) { create(:protocol, org: org, start_at: 6.days.ago, end_at: 5.days.ago) }
      let!(:future_protocol) { create(:protocol, org: org, start_at: 3.days.from_now, end_at: 4.days.from_now) }

      it "returns only the active protocol" do
        expect(org.active_protocol).to eq active_protocol
      end
    end
  end
end
