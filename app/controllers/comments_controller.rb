class CommentsController < ApplicationController
  def index
    if params[:commenter_id]
      render json: Comment.where(commenter_id: params[:commenter_id])
    elsif params[:artwork_id]
      render json: Comment.where(artwork_id: params[:artwork_id])
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save!
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.destroy(params[:id])
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:artwork_id, :commenter_id, :body)
  end
end