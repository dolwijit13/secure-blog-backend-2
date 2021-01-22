class CommentsController < ApplicationController
  def show
    comments = Comment.all
    render json: comments.map{ |comment| comment.to_api_format}, status: :ok
  end

  def add
    comment = Comment.new(content: params[:content], user_id: params[:userId], post_id: params[:postId])
    comment.display_name = comment.user.display_name
    if comment.save
      render status: :created
    else
      render status: :unauthorized
    end
  end

  def edit
  end
end
