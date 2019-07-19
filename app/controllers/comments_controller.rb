class CommentsController < ApplicationController

  def show
    @comment=Comment.find_by(id: params[:id])
    render json: @comment
  end
end
