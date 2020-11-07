class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show
    @starship = Starship.find(params[:id])
  end

  def edit
    @starship = Starship.find(params[:id])
  end

  def update
    @starship = Starship.find(params[:id])
    if @starship.update(starship_params)
      redirect_to starship_path(@starship)
    else
      render :edit
    end

  end

  def starship_params
    params.require(:starship).permit(:image_url)
  end

end
