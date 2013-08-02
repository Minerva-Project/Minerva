require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :image => "Image",
      :job => "Job",
      :school => "School",
      :languages => "Languages",
      :religion => "Religion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/Job/)
    rendered.should match(/School/)
    rendered.should match(/Languages/)
    rendered.should match(/Religion/)
  end
end
