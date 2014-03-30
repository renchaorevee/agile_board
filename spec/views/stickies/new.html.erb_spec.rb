require 'spec_helper'

describe "stickies/new.html.erb" do
  before(:each) do
    assign(:sticky, stub_model(Sticky,
      :details => "MyString",
      :archived => false
    ).as_new_record)
  end

  it "renders new sticky form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stickies_path, :method => "post" do
      assert_select "input#sticky_details", :name => "sticky[details]"
      assert_select "input#sticky_archived", :name => "sticky[archived]"
    end
  end
end
