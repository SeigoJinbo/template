class CharactersController < ApplicationController

  before_action :set_character, only: [:edit, :show]
  def index
    @characters = Character.all
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
  end

  def destroy
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

end
