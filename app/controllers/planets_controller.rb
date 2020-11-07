class PlanetsController < ApplicationController

  def edit
    @planet = Planet.find[params[:id]]
  end



end
