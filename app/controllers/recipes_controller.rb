class RecipesController < ApplicationController
  def index
    @query = params[:q]

    if params[:page].nil?
      # This is the page we are on, starting a 0
      params[:page] = 0
    end

    @page = params[:page] * 10

    all_recipes_info = ApiMuncherWrapper.get_recipes(@query, @page)

    params[:count] = all_recipes_info[0]
    @count = params[:count]

    @recipes = all_recipes_info[1]
  end

  def show
    r = params[:r]
    recipe_details = ApiMuncherWrapper.get_recipe(r)

    @recipe = recipe_details
  end

end