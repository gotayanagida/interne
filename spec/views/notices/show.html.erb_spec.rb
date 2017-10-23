require 'rails_helper'

RSpec.describe "notices/show", type: :view do
  before(:each) do
    @notice = assign(:notice, Notice.create!(
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
