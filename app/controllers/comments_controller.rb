class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.first
    @comment = Comment.new(post_params)
    @comment.garden_id = params[:garden_id]
    @comment.user_id = @user.id

    if @comment.save
      flash[:notice] = "Commentaire bien reçu !"
      redirect_to garden_path(@comment.garden_id)
    else
      puts @comment.errors.messages
      puts "erreur"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @garden = Garden.find(params[:garden_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      flash[:notice] = "Commentaire à jour"
      redirect_to garden_path(params[:garden_id])
    else
      flash.now[:alert] = "Nous ne pouvons pas modifier ce commentaire pour la ou les raison(s) suivante(s) :"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Commentaire supprimé"
      redirect_to garden_path(params[:garden_id])
    else
      flash.now[:alert] = "Nous ne pouvons pas supprimer ce commentaire pour la ou les raison(s) suivante(s) :"
      render :edit
    end
  end

  private
  def post_params
    params.require(:comment).permit(:content)
  end
end
