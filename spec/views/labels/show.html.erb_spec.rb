require 'rails_helper'

RSpec.describe "labels/show", type: :view do
  before(:each) do
    @label = assign(:label, Label.create!(
      :company => nil,
      :name => "Name",
      :color => 2,
      :counter => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
