class CreateRecipeIngredients < ActiveRecord::Migration[8.1]
  def change
    create_table :recipe_ingredients do |t|
      t.timestamps
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
