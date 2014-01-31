require 'spec_helper'

describe NoticesController do
  it "GET index" do
    not1 = Notice.create(:title=>"Title")
    not2 = Notice.create(:title=>"Title")
    
    get :index
  end
end
