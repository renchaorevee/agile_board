require 'spec_helper'

describe Column do
  let(:empty_string) { "" }
  let(:whitespace_string) { "            " }

  before(:each) do
    @attr = {
      :name => "Example Column",
      :description => "This is an example column.",
      :order => 1
    }

    @column = Column.new(@attr)
  end

  subject { @column }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:order) }

  it { should be_valid }

  describe "Name" do
    context "when name is empty" do
      before { @column.name = empty_string }

      it "should not valid" do
        should_not be_valid
      end
    end

    context "when name is too long" do
      before { @column.name = "a" * 51 }

      it "should not valid" do
        should_not be_valid
      end
    end

    context "when name only contains whitespace" do
      before { @column.name = whitespace_string }

      it "should not valid" do
        should_not be_valid
      end
    end

    context "when name contains sequential spaces" do
      before {
        @column.name = "abc    deda  fsd"
        @column.save!
      }

      it "should be squished" do
        @column.name.should eq("abc deda fsd")
      end
    end
  end

  describe "Description" do
    context "when description is empty" do
      before { @column.description = empty_string }

      it "should valid" do
        should be_valid
      end
    end

    context "when description is too long" do
      before { @column.description = "a" * 201 }

      it "should not valid" do
        should_not be_valid
      end
    end

    context "when description only contains whitespace" do
      before { @column.description = whitespace_string }
      it { should be_valid }
    end
  end

  describe "Order" do
    context "when order is an integer" do
      before { @column.order = 3 }

      it "should be valid" do
        should be_valid
      end
    end

    context "when order is not integer" do
      before { @column.order = "abc" }

      it "should not be valid" do
        should_not be_valid
      end
    end

    context "when order is nil" do
      before do
        @first_column = Column.new(@attr)
        @first_column.order = 2
        @first_column.save

        @column.order = nil
        @column.save!
      end

      it "should assign the column as the last column" do
        @column.order.should eq(@first_column.order + 1)
      end
    end
  end
end
