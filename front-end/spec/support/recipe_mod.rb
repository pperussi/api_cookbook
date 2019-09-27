module RecipeMod
    def load_recipe_mock
        stub_request(:get, 'http://0.0.0.0:3000/api/v1/recipes/1').
            with(
                headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Content-Type'=>'application/json',
                'User-Agent'=>'Faraday v0.15.4'
                }).

                to_return(status: 200, body: JSON.parse(
                          File.read(Rails.root.join('spec', 'support', 'recipe.json')),
                          symbolize_names: true), headers: {})
    end
end