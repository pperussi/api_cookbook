require "rails_helper"

describe "Gets recipes informations" do
  it "successfuly" do
    response = Faraday.get 'http://localhost:3000/api/v1/recipes/1'

    expect(response.status).to eq 200
    expect(response.body).to include 'Brigadeiro'
  end
end
