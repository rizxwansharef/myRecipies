class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
