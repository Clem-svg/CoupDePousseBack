# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApiController
      before_action :doorkeeper_authorize!
      def create
        @comment = Comment.new(post_params)
        @garden = Garden.find(params[:garden_id])
        @comment.garden_id = @garden.id
        @comment.user_id = current_user.id

        if @comment.save
          render json: @comment
        else
          puts @comment.errors.messages
        end
      end

      def edit
        @comment = Comment.find(params[:id])
        @garden = Garden.find(params[:garden_id])
      end

      def update
        @comment = Comment.find(params[:id])
        if @comment.update(post_params)
          render json: @comment
        else
          render :edit
        end
      end

      def destroy
        @comment = Comment.find(params[:id])
        if @comment.user_id == current_user.id
          @comment.destroy
          render json: { error: 'Comment successfully deleted' }, status: :ok
        else
          render json: { error: 'Cannot delete comment written by someone else' },
                 status: :unprocessable_entity
        end
      end

      private

        def post_params
          params.require(:comment).permit(:content)
        end
    end
  end
end
