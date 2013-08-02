require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :image => "MyString",
      :job => "MyString",
      :school => "MyString",
      :languages => "MyString",
      :religion => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "input#profile_image[name=?]", "profile[image]"
      assert_select "input#profile_job[name=?]", "profile[job]"
      assert_select "input#profile_school[name=?]", "profile[school]"
      assert_select "input#profile_languages[name=?]", "profile[languages]"
      assert_select "input#profile_religion[name=?]", "profile[religion]"
    end
  end
end
