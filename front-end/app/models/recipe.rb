class Recipe
    attr_reader :id, :name, :recipe_type, :difficulty, :cook_time, :ingredients
    
    def initialize(**args)
        args.each do |key, value|
            instance_variable_set("@#{key.to_s}", value)
        end
    end

    def self.find(id)
        response = CookbookApi.client.get do |req|
            req.url "recipes/#{id}"
        end

        return new(response.body) if response.status == 200
    end
end