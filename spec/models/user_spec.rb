require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
    it { should belong_to(:org) }
  end
end
