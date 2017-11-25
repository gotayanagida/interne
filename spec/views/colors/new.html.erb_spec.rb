require 'rails_helper'

RSpec.describe "colors/new", type: :view do
  before(:each) do
    assign(:color, Color.new(
      :main => "MyString",
      :bg => "MyString",
      :grad_1 => "MyString",
      :grad_2 => "MyString"
    ))
  end

  it "renders new color form" do
    render

    assert_select "form[action=?][method=?]", colors_path, "post" do

      assert_select "input[name=?]", "color[main]"

      assert_select "input[name=?]", "color[bg]"

      assert_select "input[name=?]", "color[grad_1]"

      assert_select "input[name=?]", "color[grad_2]"
    end
  end
end
