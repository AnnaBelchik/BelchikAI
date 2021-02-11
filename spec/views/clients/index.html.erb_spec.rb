require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        surname: "Surname",
        forename: "Forename",
        middle_name: "Middle Name",
        phone: "Phone",
        password: "Password"
      ),
      Client.create!(
        surname: "Surname",
        forename: "Forename",
        middle_name: "Middle Name",
        phone: "Phone",
        password: "Password"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", text: "Surname".to_s, count: 2
    assert_select "tr>td", text: "Forename".to_s, count: 2
    assert_select "tr>td", text: "Middle Name".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
  end
end
