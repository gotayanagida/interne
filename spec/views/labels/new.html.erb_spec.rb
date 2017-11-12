require 'rails_helper'

RSpec.describe "labels/new", type: :view do
  before(:each) do
    assign(:label, Label.new(
      :company => nil,
      :name => "MyString",
      :color => 1,
      :counter => 1
    ))
  end

  it "renders new label form" do
    render

    assert_select "form[action=?][method=?]", labels_path, "post" do

      assert_select "input[name=?]", "label[company_id]"

      assert_select "input[name=?]", "label[name]"

      assert_select "input[name=?]", "label[color]"

      assert_select "input[name=?]", "label[counter]"
    end
  end
end
