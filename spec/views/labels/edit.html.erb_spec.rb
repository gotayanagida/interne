require 'rails_helper'

RSpec.describe "labels/edit", type: :view do
  before(:each) do
    @label = assign(:label, Label.create!(
      :company => nil,
      :name => "MyString",
      :color => 1,
      :counter => 1
    ))
  end

  it "renders the edit label form" do
    render

    assert_select "form[action=?][method=?]", label_path(@label), "post" do

      assert_select "input[name=?]", "label[company_id]"

      assert_select "input[name=?]", "label[name]"

      assert_select "input[name=?]", "label[color]"

      assert_select "input[name=?]", "label[counter]"
    end
  end
end
