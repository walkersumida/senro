require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :body => "MyText",
      :status => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "textarea[name=?]", "item[body]"

      assert_select "input[name=?]", "item[status]"
    end
  end
end
