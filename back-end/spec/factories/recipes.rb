FactoryBot.define do
  factory :recipe do
    name { "Brigadeiro" }
    recipe_type { "Sobremesa" }
    difficulty { "Fácil" }
    cook_time { 30 }
    ingredients { "Leite condensado, manteiga e chocolate em pó" }
  end
end
