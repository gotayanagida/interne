require 'rails_helper'

RSpec.describe "colors/show", type: :view do
  before(:each) do
    @color = assign(:color, Color.create!(
      :main => "Main",
      :bg => "Bg",
      :grad_1 => "Grad 1",
      :grad_2 => "Grad 2"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Main/)
    expect(rendered).to match(/Bg/)
    expect(rendered).to match(/Grad 1/)
    expect(rendered).to match(/Grad 2/)
  end
end
