require "rails_helper"

RSpec.describe OrgPolicy, type: :policy do
  let(:org) { create(:org) }
  let(:other_org) { create(:org) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Org.all).resolve
  end

  subject { described_class.new(user, org) }

  context "when user is admin" do
    let(:user) { build(:user, :admin, org: org) }

    it "includes org and other_org in resolved scope" do
      expect(resolved_scope).to include(org)
      expect(resolved_scope).to include(other_org)
    end

    it { is_expected.to permit_all_actions }
  end

  context "when user is not admin" do
    let(:user) { build(:user, org: org) }

    it "does not include object_from_other_org in resolved scope" do
      expect(resolved_scope).to include(org)
      expect(resolved_scope).not_to include(other_org)
    end

    context "when object is from the same org" do
      it { is_expected.to forbid_all_actions }
    end

    context "when object is from another org" do
      subject { described_class.new(user, other_org) }

      it { is_expected.to forbid_all_actions }
    end
  end
end
