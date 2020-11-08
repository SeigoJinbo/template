class PlanetsController < ApplicationController

  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet = Planet.find(params[:id])
    if @planet.update(planet_params)
      redirect_to planet_path(@planet)
    else
      render :edit
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:image_url)
  end
end
