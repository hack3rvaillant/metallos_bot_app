require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:email) }  
    # it { should have_secure_encrypted_password }
    it { should validate_presence_of(:encrypted_password) }  
  end

  context "Associations" do
    it { should belong_to(:org) }
  end
end
