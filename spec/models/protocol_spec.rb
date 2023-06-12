# == Schema Information
#
# Table name: protocols
#
#  id                 :bigint           not null, primary key
#  about              :text
#  content            :text
#  copyright_cleared  :boolean          default(FALSE)
#  creation_year      :integer
#  duration           :string
#  internal_notes     :text
#  official_title     :string
#  participation_mode :string
#  props_needed       :text
#  punchline          :string
#  status             :string           default("draft")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  artist_id          :bigint           not null
#  org_id             :bigint           not null
#
# Indexes
#
#  index_protocols_on_artist_id  (artist_id)
#  index_protocols_on_org_id     (org_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#  fk_rails_...  (org_id => orgs.id)
#
require "rails_helper"

RSpec.describe Protocol, type: :model do
  describe "Factory" do
    subject { build(:protocol) }

    it "is valid" do
      expect(subject).to be_valid
    end
  end

  describe "Validations" do
    subject { build(:protocol) }

    it { should validate_presence_of(:punchline) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:status) }

    it {
      should define_enum_for(:status).backed_by_column_of_type(:string).with_values({:draft=>"draft",
 :ready_to_review=>"ready_to_review",
 :published=>"published"}) #.with_values(I18n.t("models.protocol.statuses", locale: :en))
    }

    it {
      puts described_class::DURATIONS
      should define_enum_for(:duration)
        .with_values(described_class::DURATIONS)
        .backed_by_column_of_type(:string)
    }

    it { should validate_presence_of(:participation_mode) }

    it do
      should define_enum_for(:participation_mode)
        .with_values(described_class::PARTICIPATION_MODES)
        .backed_by_column_of_type(:string)
    end
  end

  describe "Associations" do
    it { should belong_to(:artist) }
    it { should belong_to(:org) }
    it { should have_many(:bot_broadcasts) }
    it { should have_many(:events) }
  end

  describe "Nested Attributes" do
    it { should accept_nested_attributes_for(:events) }
    it { should accept_nested_attributes_for(:bot_broadcasts) }
  end

  describe "Scopes" do
    describe ".cleared" do
      subject { described_class.cleared }

      context "when some protocols are cleared and some aren't" do
        let(:copyright_cleared_protocols) { create_list(:protocol, 3, :cleared) }
        let!(:other_protocols) { create_list(:protocol, 3) }

        it "returns only the cleared ones" do
          is_expected.to eq copyright_cleared_protocols
        end
      end
    end
  end
end
