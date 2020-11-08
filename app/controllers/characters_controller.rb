class CharactersController < ApplicationController
  before_action :set_character, only: [:edit, :update, :show]
  def index
    @characters = Character.all.sort_by { |character| character.id }
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @characters = Character.where("name ILIKE ?", "%#{@name}%")
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
    if @character.update(character_params)
      redirect_to character_path(@character)
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:image_url)
  end

end
