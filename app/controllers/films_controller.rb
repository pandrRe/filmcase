class FilmsController < ApplicationController
  def index
    render json: Film.all
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      render json: @film
    else
      render json: nil
    end
  end

  def show
    render json: Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])

    if @film.update(film_params)
      render json: @film
    else
      render json: nil
    end
  end

  def destroy
    @film = Film.find(params[:id])

    if @film.destroy
      render json: { id: @film.id }
    end
  end

  private
    def film_params
      params.require(:film).permit(:title, :year, :synopsis, :director_id, :rating, :url)
    end
end
