require 'spec_helper'

describe "stickies/index.html.erb" do
  before(:each) do
    assign(:stickies, [
      stub_model(Sticky,
        :details => "Details",
        :archived => false
      ),
      stub_model(Sticky,
        :details => "Details",
        :archived => false
      )
    ])
  end

  it "renders a list of stickies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Details".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
