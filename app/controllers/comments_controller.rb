class CommentsController < ApplicationController

  def create
    @comment=Comment.create(comment_params)
    render json: @comment, status: 201
  end

  def show
    @comment=Comment.find_by(id: params[:id])
    render json: @comment
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :recipe_id)
  end
end
