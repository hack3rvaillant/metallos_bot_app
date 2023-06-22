# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  address     :string
#  happen_at   :datetime
#  lat         :string
#  long        :string
#  place       :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  protocol_id :bigint           not null
#
# Indexes
#
#  index_events_on_protocol_id  (protocol_id)
#
# Foreign Keys
#
#  fk_rails_...  (protocol_id => protocols.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:place) }

    context "when event is online" do
      let(:subject) { build(:event, place: "online") }

      it { should validate_presence_of(:url) }
      it { should_not validate_presence_of(:address) }
    end

    context "when event is irl" do
      let(:subject) { build(:event, place: "irl") }

      it { should validate_presence_of(:address) }
      it { should_not validate_presence_of(:url) }
    end

    it { should validate_presence_of(:happen_at) }

    xit {
      should define_enum_for(:place)
      .with_values(described_class::PLACES)
      .backed_by_column_of_type(:string)
    }
  end
end
