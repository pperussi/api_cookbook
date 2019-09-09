class Api::V1::RecipesController < Api::V1::ApiController
  before_action :find_recipe, only: %i[ show update destroy]

  def index
    @recipe = Recipe.all
  end

  def show
    render json: @recipe, status: :ok
  end

  def create
  @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: 'Não foi possível criar essa Receita' , status: :precondition_failed
    end
  end

  def destroy
    @recipe.destroy
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe, status: :no_content
    else
      render json: 'Não foi possível atualizar essa Receita' , status: :precondition_failed
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])

    rescue ActiveRecord::RecordNotFound
    render json: 'Receita não encontrada', status: :not_found
  end

  def recipe_params
    params.require(:recipe).permit(:name, :recipe_type, :difficulty, :cook_time, :ingredients)
  end
end
