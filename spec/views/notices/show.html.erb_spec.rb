require 'spec_helper'

describe "notices/show" do
  before(:each) do
    @notice = assign(:notice, stub_model(Notice,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
