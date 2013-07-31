require 'spec_helper'

describe "courses/edit" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :title => "MyString",
      :instructor => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", course_path(@course), "post" do
      assert_select "input#course_title[name=?]", "course[title]"
      assert_select "input#course_instructor[name=?]", "course[instructor]"
      assert_select "textarea#course_description[name=?]", "course[description]"
    end
  end
end
