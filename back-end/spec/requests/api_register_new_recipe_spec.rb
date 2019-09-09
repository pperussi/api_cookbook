require 'rails_helper'

describe 'Register new recipe' do
  it 'succesfully' do
    post '/api/v1/recipes', params: {recipe: {name: 'Brigadeiro', recipe_type:'Sobremesa', difficulty: 'Fácil', cook_time: 30, ingredients: 'Leite condensado, manteiga e chocolate em pó'}}

    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 201
    expect(json_recipe[:name]).to eq 'Brigadeiro'
    expect(json_recipe[:recipe_type]).to eq 'Sobremesa'
    expect(json_recipe[:difficulty]).to eq 'Fácil'
    expect(json_recipe[:cook_time]).to eq 30
    expect(json_recipe[:ingredients]).to eq 'Leite condensado, manteiga e chocolate em pó'
  end
  it 'can not be blank' do
    post '/api/v1/recipes', params: {recipe: {name: '', recipe_type:'Sobremesa', difficulty: 'Fácil', cook_time: 30, ingredients: 'Leite condensado, manteiga e chocolate em pó'}}

    expect(response.status).to eq 412
    expect(response.body).to include 'Não foi possível criar essa Receita'
  end
end
