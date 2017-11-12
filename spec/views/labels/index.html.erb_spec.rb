require 'rails_helper'

RSpec.describe "labels/index", type: :view do
  before(:each) do
    assign(:labels, [
      Label.create!(
        :company => nil,
        :name => "Name",
        :color => 2,
        :counter => 3
      ),
      Label.create!(
        :company => nil,
        :name => "Name",
        :color => 2,
        :counter => 3
      )
    ])
  end

  it "renders a list of labels" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
