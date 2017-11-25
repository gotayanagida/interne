require 'rails_helper'

RSpec.describe "colors/index", type: :view do
  before(:each) do
    assign(:colors, [
      Color.create!(
        :main => "Main",
        :bg => "Bg",
        :grad_1 => "Grad 1",
        :grad_2 => "Grad 2"
      ),
      Color.create!(
        :main => "Main",
        :bg => "Bg",
        :grad_1 => "Grad 1",
        :grad_2 => "Grad 2"
      )
    ])
  end

  it "renders a list of colors" do
    render
    assert_select "tr>td", :text => "Main".to_s, :count => 2
    assert_select "tr>td", :text => "Bg".to_s, :count => 2
    assert_select "tr>td", :text => "Grad 1".to_s, :count => 2
    assert_select "tr>td", :text => "Grad 2".to_s, :count => 2
  end
end
