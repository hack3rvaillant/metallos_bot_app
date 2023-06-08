require "rails_helper"

RSpec.describe ArtistPolicy, type: :policy do
  let(:object) { create(:artist) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Artist.all).resolve
  end

  subject { described_class.new(user, object) }

  context "when user is admin" do
    let(:user) { build(:user, :admin) }

    it "includes object and object_from_other_org in resolved scope" do
      expect(resolved_scope).to include(object)
    end

    it { is_expected.to permit_all_actions }
  end

  context "when user is not admin" do
    let(:user) { build(:user) }

    it "includes object in resolved scope" do
      expect(resolved_scope).to include(object)
    end

    it { is_expected.to permit_only_actions(%i[index show]) }
  end
end
