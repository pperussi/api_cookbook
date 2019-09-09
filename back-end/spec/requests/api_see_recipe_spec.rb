require 'rails_helper'

describe 'See new recipe' do
  it 'succesfully' do
    recipe = create(:recipe)

    get '/api/v1/recipes/1'

    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_recipe[:name]).to eq 'Brigadeiro'
    expect(json_recipe[:recipe_type]).to eq 'Sobremesa'
    expect(json_recipe[:difficulty]).to eq 'Fácil'
    expect(json_recipe[:cook_time]).to eq 30
    expect(json_recipe[:ingredients]).to eq 'Leite condensado, manteiga e chocolate em pó'
  end
  it 'not found' do
    get '/api/v1/recipes/99'

    expect(response.status).to eq 404
    expect(response.body).to include('Receita não encontrada')
  end
end
