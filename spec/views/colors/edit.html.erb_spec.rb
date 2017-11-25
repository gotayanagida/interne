require 'rails_helper'

RSpec.describe "colors/edit", type: :view do
  before(:each) do
    @color = assign(:color, Color.create!(
      :main => "MyString",
      :bg => "MyString",
      :grad_1 => "MyString",
      :grad_2 => "MyString"
    ))
  end

  it "renders the edit color form" do
    render

    assert_select "form[action=?][method=?]", color_path(@color), "post" do

      assert_select "input[name=?]", "color[main]"

      assert_select "input[name=?]", "color[bg]"

      assert_select "input[name=?]", "color[grad_1]"

      assert_select "input[name=?]", "color[grad_2]"
    end
  end
end
