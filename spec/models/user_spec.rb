require "spec_helper"  

describe User  do
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_uniqueness_of(:api_key) }

  describe "Associations" do
    it { should have_many(:links) }
  end
end