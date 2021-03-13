class DirectorsController < ApplicationController
  def index
    render json: Director.all
  end
end
