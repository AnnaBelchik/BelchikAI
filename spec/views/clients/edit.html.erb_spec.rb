require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      surname: "MyString",
      forename: "MyString",
      middle_name: "MyString",
      phone: "MyString",
      password: "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input[name=?]", "client[surname]"

      assert_select "input[name=?]", "client[forename]"

      assert_select "input[name=?]", "client[middle_name]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[password]"
    end
  end
end
