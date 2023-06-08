require "rails_helper"

RSpec.describe ProtocolPolicy, type: :policy do
  let(:org) { create(:org) }
  let(:object) { create(:protocol, org: org) }
  let(:other_org) { create(:org) }
  let(:object_from_other_org) { create(:protocol, org: other_org) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Protocol.all).resolve
  end

  subject { described_class.new(user, object) }

  context "when user is admin" do
    let(:user) { build(:user, :admin, org: org) }

    it "includes object and object_from_other_org in resolved scope" do
      expect(resolved_scope).to include(object)
      expect(resolved_scope).to include(object_from_other_org)
    end

    it { is_expected.to permit_all_actions }
  end

  context "when user is not admin" do
    let(:user) { build(:user, org: org) }

    it "does not include object_from_other_org in resolved scope" do
      expect(resolved_scope).to include(object)
      expect(resolved_scope).not_to include(object_from_other_org)
    end

    context "when object is from the same org" do
      it { is_expected.to permit_all_actions }
    end

    context "when object is from another org" do
      subject { described_class.new(user, object_from_other_org) }

      it { is_expected.to forbid_all_actions }
    end
  end
end
