# == Schema Information
#
# Table name: protocols
#
#  id                        :integer          not null, primary key
#  address_of_event          :string
#  bot_cta                   :string
#  bot_intro                 :text
#  bot_outro                 :text
#  bot_steps                 :text
#  bot_visible               :boolean          default(FALSE)
#  content                   :text
#  copyright_cleared         :boolean          default(FALSE)
#  datetime_of_event         :datetime
#  duration_in_minutes       :integer
#  end_at                    :datetime
#  participation_type        :string
#  place                     :string
#  props_needed              :text
#  start_at                  :datetime
#  status                    :string           default("draft")
#  telegram_conversation_url :string
#  temporality               :string
#  title                     :string
#  url_of_event              :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  artist_id                 :integer          not null
#  org_id                    :integer          not null
#
# Indexes
#
#  index_protocols_on_artist_id  (artist_id)
#  index_protocols_on_org_id     (org_id)
#
# Foreign Keys
#
#  artist_id  (artist_id => artists.id)
#  org_id     (org_id => orgs.id)
#
require "rails_helper"

RSpec.describe Protocol, type: :model do
  describe "Validations" do
    subject { build(:protocol) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
    it { should validate_presence_of(:status) }

    it do
      should define_enum_for(:status)
        .with_values(described_class::STATUSES)
        .backed_by_column_of_type(:string)
    end

    it { should validate_presence_of(:temporality) }

    it do
      should define_enum_for(:temporality)
        .with_values(described_class::TEMPORALITIES)
        .backed_by_column_of_type(:string)
    end

    it { should validate_presence_of(:participation_type) }

    it do
      should define_enum_for(:participation_type)
        .with_values(described_class::PARTICIPATION_TYPES)
        .backed_by_column_of_type(:string)
    end

    it { should validate_presence_of(:place) }

    it do
      should define_enum_for(:place)
        .with_values(described_class::PLACES)
        .backed_by_column_of_type(:string)
    end

    context "when event is online" do
      subject(:subject) { build(:protocol, place: :online) }

      it { should validate_presence_of(:url_of_event) }
      it { should_not validate_presence_of(:address_of_event) }
      it { should_not validate_presence_of(:datetime_of_event) }
    end

    context "when event is onsite" do
      subject(:subject) { build(:protocol, place: :onsite) }

      it { should validate_presence_of(:address_of_event) }
      it { should_not validate_presence_of(:url_of_event) }
      it { should validate_presence_of(:datetime_of_event) }
    end

    it { should validate_presence_of(:duration_in_minutes) }
    it { should validate_inclusion_of(:copyright_cleared).in_array([true, false]) }
    it { should validate_inclusion_of(:bot_visible).in_array([true, false]) }

    context "when protocol is visible by bot" do
      subject { build(:protocol, bot_visible: true) }

      it { should validate_presence_of(:bot_intro) } # if bot_visible
      it { should validate_presence_of(:bot_steps) } # if bot_visible
      it { should validate_presence_of(:bot_outro) } # if bot_visible
      it { should validate_presence_of(:bot_cta) } # if bot_visible
      it { should validate_presence_of(:telegram_conversation_url) } # if bot_visible
    end

    context "when protocol is not visible by bot" do
      subject { build(:protocol, bot_visible: false) }

      it { should_not validate_presence_of(:bot_intro) } # if bot_visible
      it { should_not validate_presence_of(:bot_steps) } # if bot_visible
      it { should_not validate_presence_of(:bot_outro) } # if bot_visible
      it { should_not validate_presence_of(:bot_cta) } # if bot_visible
      it { should_not validate_presence_of(:telegram_conversation_url) } # if bot_visible
    end
  end

  context "Associations" do
    it { should belong_to(:artist) }
    it { should belong_to(:org) }
  end

  describe "Factory" do
    subject { build(:protocol) }

    it "is valid" do
      expect(subject).to be_valid
    end
  end
end