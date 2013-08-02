require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :image => "Image",
        :job => "Job",
        :school => "School",
        :languages => "Languages",
        :religion => "Religion"
      ),
      stub_model(Profile,
        :image => "Image",
        :job => "Job",
        :school => "School",
        :languages => "Languages",
        :religion => "Religion"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Job".to_s, :count => 2
    assert_select "tr>td", :text => "School".to_s, :count => 2
    assert_select "tr>td", :text => "Languages".to_s, :count => 2
    assert_select "tr>td", :text => "Religion".to_s, :count => 2
  end
end
