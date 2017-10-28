require 'rails_helper'

RSpec.describe "stamps/show", type: :view do
  before(:each) do
    @stamp = assign(:stamp, Stamp.create!(
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
  end
end
