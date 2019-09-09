require 'rails_helper'

describe 'Delete recipe' do
  it 'succesfully' do
    recipe = create(:recipe)

    delete '/api/v1/recipes/1'

    expect(response.status).to eq 204
  end
end
