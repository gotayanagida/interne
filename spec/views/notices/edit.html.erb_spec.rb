require 'rails_helper'

RSpec.describe "notices/edit", type: :view do
  before(:each) do
    @notice = assign(:notice, Notice.create!(
      :body => "MyText"
    ))
  end

  it "renders the edit notice form" do
    render

    assert_select "form[action=?][method=?]", notice_path(@notice), "post" do

      assert_select "textarea[name=?]", "notice[body]"
    end
  end
end
