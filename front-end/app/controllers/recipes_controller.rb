class RecipesController < ApplicationController
  def show
    @recipe ||= Recipe.find(1)
  end

  def new
    render :new
  end
end
