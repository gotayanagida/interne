require 'rails_helper'

RSpec.describe "notices/index", type: :view do
  before(:each) do
    assign(:notices, [
      Notice.create!(
        :body => "MyText"
      ),
      Notice.create!(
        :body => "MyText"
      )
    ])
  end

  it "renders a list of notices" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
