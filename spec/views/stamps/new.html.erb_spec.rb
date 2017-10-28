require 'rails_helper'

RSpec.describe "stamps/new", type: :view do
  before(:each) do
    assign(:stamp, Stamp.new(
      :url => "MyString"
    ))
  end

  it "renders new stamp form" do
    render

    assert_select "form[action=?][method=?]", stamps_path, "post" do

      assert_select "input[name=?]", "stamp[url]"
    end
  end
end
