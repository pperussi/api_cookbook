require 'rails_helper'

describe 'Edit recipe' do
  it 'succesfully' do
    recipe = create(:recipe, name: 'Salada')

    path '/api/v1/recipes/1'
    put '/api/v1/recipes/1', params: {recipe: {name: 'Brigadeiro', recipe_type:'Sobremesa', difficulty: 'Fácil', cook_time: 30, ingredients: 'Leite condensado, manteiga e chocolate em pó'}}

    expect(response.status).to eq 204
  end
  it 'very succesfully' do
    recipe = create(:recipe, name: 'Salada')

    path '/api/v1/recipes/1'
    put '/api/v1/recipes/1', params: {recipe: {name: 'Brigadeiro', recipe_type:'Sobremesa', difficulty: 'Fácil', cook_time: 30, ingredients: 'Leite condensado, manteiga e chocolate em pó'}}

    get '/api/v1/recipes/1'
    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_recipe[:name]).to eq 'Brigadeiro'
  end
end
