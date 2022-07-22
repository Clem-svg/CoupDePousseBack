class GardensController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def new
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
    @user = @garden.user
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])
    if @garden.update(gardens_params)
      flash[:notice] = "Annonce éditée !"
      redirect_to garden_path(@garden.id)
    else
      flash.now[:alert] = "Impossible d'éditer l'annonce' :"
      render :edit
    end
  end

  def create
    @garden = Garden.new(gardens_params.merge(user_id: current_user.id))
    if @garden.save
      redirect_to root_path
      flash[:success] = "Annonce créée avec succès !"
    else
      render :new
    end
  end

  #Display all the gardens or the gardens found by query
  def index
    @gardens = Garden.search(params[:query])
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "L'annonce est supprimée" }
      format.js {}
    end
  end

  private

  def gardens_params
    params.require(:garden).permit(:title, :description, :orientation, :floor_type, :parking, :tools_available, :surface, :picture, :street_number, :street_name, :zip_code, :city, :country, :query)
  end

end

