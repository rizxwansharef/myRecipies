class AddChefIdAgainToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_column :recipes, :chef_id, :integer
  end
end
