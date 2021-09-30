class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = set_recipe
    @ingredients = Ingredient.all
  end

  def update
    @recipe = set_recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end
  end

  private

  def set_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
