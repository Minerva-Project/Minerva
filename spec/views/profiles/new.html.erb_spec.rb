require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :image => "MyString",
      :job => "MyString",
      :school => "MyString",
      :languages => "MyString",
      :religion => "MyString"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
      assert_select "input#profile_image[name=?]", "profile[image]"
      assert_select "input#profile_job[name=?]", "profile[job]"
      assert_select "input#profile_school[name=?]", "profile[school]"
      assert_select "input#profile_languages[name=?]", "profile[languages]"
      assert_select "input#profile_religion[name=?]", "profile[religion]"
    end
  end
end
