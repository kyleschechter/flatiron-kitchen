class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def edit
    @ingredient = set_ingredient
  end

  def update
    @ingredient = set_ingredient
    
    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  private 

  def set_ingredient
    Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
