require 'spec_helper'

describe StickiesOwners do
  before do
    @attr = {
      sticky_id: 1,
      user_id: 1
    }

    @sticky_owner = StickiesOwners.new(@attr)
  end

  subject {@sticky_owner}

  it { should respond_to(:sticky_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  context "when sticky_id is nil" do
    before { @sticky_owner.sticky_id = nil }

    it "should not be valid" do
      should_not be_valid
    end
  end

  context "when user_id is nil" do
    before { @sticky_owner.user_id = nil }

    it "should not be valid" do
      should_not be_valid
    end
  end
end