require 'rails_helper'

RSpec.describe "todos/index", type: :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        :body => "MyText",
        :link => "Link",
        :status => 2
      ),
      Todo.create!(
        :body => "MyText",
        :link => "Link",
        :status => 2
      )
    ])
  end

  it "renders a list of todos" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
