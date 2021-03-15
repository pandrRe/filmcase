class DirectorsController < ApplicationController
  def index
    render json: Director.all
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      render json: @director
    else
      render json: nil
    end
  end

  private
    def director_params
      params.require(:director).permit(:name, :surname)
    end
end
