class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.new(toy_params)
    if toy.save
      render json: toy
    else
      render json: { errors: toy.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def update
    toy = Toy.find(params[:id])
    if toy.update(toy_params)
      render json: toy
    else
      render json: { errors: toy.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    render json: { message: "Toy donated successfully" }
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
