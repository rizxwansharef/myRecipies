class RecipesController < ApplicationController
  before_action :require_login , except: %i[index show]
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :set_ingredients, only: %i[new edit create update]

  def index
    @recipes = Recipe.includes(:chef, :comments)

    if params[:chef_id].present?
      @recipes = @recipes.where(chef_id: params[:chef_id])
    else
      if logged_in?
        @my_recipes = @recipes.where(chef_id: current_chef.id)
        @other_recipes = @recipes.where.not(chef_id: current_chef.id)
      else
        @my_recipes = Recipe.none
        @other_recipes = @recipes
      end
    end
  end

  def show
    @comment = Comment.new
  end
 
  def new
    @recipe = Recipe.new(chef_id: params[:chef_id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef_id =current_chef.id
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully deleted."
  end

  private

  def set_recipe
    @recipe = Recipe.includes(:chef, :ingredients, comments: :chef).find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :chef_id, ingredient_ids: [])
  end

  def set_ingredients
    @ingredients = Ingredient.all.order(:name)
  end
  
  
end



