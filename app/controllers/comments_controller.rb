class CommentsController < ApplicationController
  def show
    comments = Comment.all
    render json: comments.map{ |comment| comment.to_api_format}, status: :ok
  end

  def add
  end

  def edit
  end
end
