require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      surname: "MyString",
      forename: "MyString",
      middle_name: "MyString",
      phone: "MyString",
      password: "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[surname]"

      assert_select "input[name=?]", "client[forename]"

      assert_select "input[name=?]", "client[middle_name]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[password]"
    end
  end
end
