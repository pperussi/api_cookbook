require 'rails_helper'

feature 'Api show recipe' do
    scenario 'succesfully' do
        WebMock.disable_net_connect!
        stub_request(:get, "http://0.0.0.0:3000/api/v1/recipes/1").
        with(
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'aplication/json',
            'User-Agent'=>'Faraday v0.16.0'
          }).
        to_return(status: 200, body: File.read(Rails.root.join('spec', 'support', 'recipe.json')),
        headers: { 'Content-Type' => 'aplication/json' })


        visit "/recipes/1"

        expect(page).to have_content('Brigadeiro')
        WebMock.allow_net_connect!
    end
end