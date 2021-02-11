require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      surname: "Surname",
      forename: "Forename",
      middle_name: "Middle Name",
      phone: "Phone",
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Forename/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Password/)
  end
end
