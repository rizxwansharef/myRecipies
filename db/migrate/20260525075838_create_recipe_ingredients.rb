class CreateRecipeIngredients < ActiveRecord::Migration[8.1]
  def change
    create_table :recipe_ingredients do |t|
      t.timestamps
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
    end
  end
end
