require 'rails_helper'

RSpec.describe "notices/new", type: :view do
  before(:each) do
    assign(:notice, Notice.new(
      :body => "MyText"
    ))
  end

  it "renders new notice form" do
    render

    assert_select "form[action=?][method=?]", notices_path, "post" do

      assert_select "textarea[name=?]", "notice[body]"
    end
  end
end
