class FavoritesController < ApplicationController
  before_action :find_garden
  before_action :find_favorite, only: [:destroy]


  def create
    if already_liked?
      flash[:notice] = "Tu ne peux aimer qu'une fois ce jardin"
    else
      @garden.favorites.create(user_id: current_user.id)
    end
    redirect_to garden_path(@garden)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @favorite.destroy
    end
    redirect_to garden_path(@garden)
  end

  def find_favorite
    @favorite = @garden.favorites.find(params[:id])
  end

  private
  def find_garden
    @garden = Garden.find(params[:garden_id])
  end

  def already_liked?
    Favorite.where(user_id: current_user.id, garden_id:
    params[:garden_id]).exists?
  end
end