require 'spec_helper'

describe Sticky do
  let(:empty_string) { "" }
  let(:whitespace_string) { "            " }

  before(:each) do
    @attr = { :details => "This is an example Sticky." }
    @sticky = Sticky.new(@attr)
  end

  subject { @sticky }

  it { should respond_to(:details) }

  it { should be_valid }
  it { should_not be_archived }

  describe "Details" do
    context "when details is empty" do
      before { @sticky.details = empty_string }

      it "should be valid" do
        should be_valid
      end
    end

    context "when details is nil" do
      before { @sticky.details = nil }

      it "should be valid" do
        should be_valid
      end
    end

    context "when details is too long" do
      before { @sticky.details = "a" * 141 }

      it "should not be valid" do
        should_not be_valid
      end
    end
  end

end
