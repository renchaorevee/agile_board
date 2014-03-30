require 'spec_helper'

describe "columns/edit.html.erb" do
  before(:each) do
    @column = assign(:column, stub_model(Column,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit column form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => columns_path(@column), :method => "post" do
      assert_select "input#column_name", :name => "column[name]"
      assert_select "input#column_description", :name => "column[description]"
    end
  end
end
