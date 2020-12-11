class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:update, :destroy]
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      render json: { comment: CommentSerializer.new(@comment) }, status: :created
    else
      render json: { error: 'failed to create comment' }, status: :not_acceptable
    end
  end
  
  def update
    @comment.update(comment_params)
    render json: { comment: CommentSerializer.new(@comment) }, status: :ok
  end
  
  def destroy
    @comment.delete
    render json: {}, status: :accepted
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :content)
  end
  
  def find_comment
    @comment = Comment.find(params[:id])
  end

end
