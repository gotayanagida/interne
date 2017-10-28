require 'rails_helper'

RSpec.describe "stamps/index", type: :view do
  before(:each) do
    assign(:stamps, [
      Stamp.create!(
        :url => "Url"
      ),
      Stamp.create!(
        :url => "Url"
      )
    ])
  end

  it "renders a list of stamps" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
