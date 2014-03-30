require 'spec_helper'

describe Sticky do
  let(:empty_string) { "" }
  let(:whitespace_string) { "            " }

  before(:each) do
    @first_column_attr = {
      :name => "First Example Column",
      :description => "This is the first example column.",
      :column_order => 1
    }
    @first_column = Column.new(@first_column_attr)
    @first_column.save!

    @attr = {
      :details => "This is an example Sticky.",
      :column_id => @first_column.id
    }
    @sticky = Sticky.new(@attr)
  end

  subject { @sticky }

  it { should respond_to(:details) }
  it { should respond_to(:column) }
  it { should respond_to(:owners) }

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

  describe "Column" do
    context "when column id is nil" do
      before { @sticky.column_id = nil }

      it "should not be valid" do
        should_not be_valid
      end
    end

    context "when column id is not integer" do
      before { @sticky.column_id = "a" }

      it "should not be valid" do
        should_not be_valid
      end
    end

    context "when column id is set" do
      before { @sticky.save! }

      it "should able to get the attached column" do
        @sticky.column.should eq(@first_column)
      end
    end

    context "when column id is changed" do
      before do
        @second_column_attr = {
          :name => "Second Example Column",
          :description => "This is the second example column.",
          :column_order => 2
        }
        @second_column = Column.new(@second_column_attr)
        @second_column.save!

        @sticky.column_id = @second_column.id
        @sticky.save!
      end

      it "should be able to update the sticky" do
        @sticky.column.should eq(@second_column)
      end
    end
  end

  describe "Owners" do
    context "when owners are not assigned" do
      before { @sticky.owners = [] }
      it "should be valid" do
        should be_valid
      end
    end

    context "when a owner is assigned" do
      before do
        @first_owner = Factory(:user)
        @sticky.owners = [ @first_owner ]
        @sticky.save!
      end

      it "should be valid" do
        should be_valid
      end

      it "should belong to correct owner" do
        @sticky.owners.length.should eq(1)
        @sticky.owners.should include(@first_owner)
      end
    end

    context "when several owners are assigned" do
      before do
        @first_owner = Factory(:user)
        @second_owner = Factory(:user, :email => Factory.next(:email))
        @sticky.owners = [ @first_owner, @second_owner ]
        @sticky.save!
      end

      it "should be valid" do
        should be_valid
      end

      it "should belong to correct owner" do
        @sticky.owners.length.should eq(2)
        @sticky.owners.should include(@first_owner)
        @sticky.owners.should include(@second_owner)
      end
    end

    context "when the sticky is deleted" do
      before do
        @first_owner = Factory(:user)
        @second_owner = Factory(:user, :email => Factory.next(:email))
        @sticky.owners = [ @first_owner, @second_owner ]
        @sticky.save!
      end

      it "should delete the owning relationship but not the owners" do
        @sticky.destroy
        [@first_owner, @second_owner].each do |owner|
          lambda do
            StickiesOwners.find(owner)
          end.should raise_error(ActiveRecord::RecordNotFound)

          lambda do
            User.find(owner)
          end.should_not raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

  end
end
