require 'rails_helper'

RSpec.describe "todos/new", type: :view do
  before(:each) do
    assign(:todo, Todo.new(
      :body => "MyText",
      :link => "MyString",
      :status => 1
    ))
  end

  it "renders new todo form" do
    render

    assert_select "form[action=?][method=?]", todos_path, "post" do

      assert_select "textarea[name=?]", "todo[body]"

      assert_select "input[name=?]", "todo[link]"

      assert_select "input[name=?]", "todo[status]"
    end
  end
end
