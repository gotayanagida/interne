require 'rails_helper'

RSpec.describe "stamps/edit", type: :view do
  before(:each) do
    @stamp = assign(:stamp, Stamp.create!(
      :url => "MyString"
    ))
  end

  it "renders the edit stamp form" do
    render

    assert_select "form[action=?][method=?]", stamp_path(@stamp), "post" do

      assert_select "input[name=?]", "stamp[url]"
    end
  end
end
