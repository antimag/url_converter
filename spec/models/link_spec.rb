require "spec_helper"  

describe Link  do
  describe "Associations" do
    it { should belong_to(:user) }
  end
end