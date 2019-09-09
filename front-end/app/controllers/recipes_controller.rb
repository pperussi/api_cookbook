class RecipesController < ApplicationController

  def show
    response = Faraday.get 'http://localhost:3000/api/v1/1'
    render json: response, status: :ok
  end

  def new
    render :new
  end
end
