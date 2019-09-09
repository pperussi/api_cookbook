class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :recipe_type
      t.string :difficulty
      t.integer :cook_time
      t.text :ingredients

      t.timestamps
    end
  end
end
