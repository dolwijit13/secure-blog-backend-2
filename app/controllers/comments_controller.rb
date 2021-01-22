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
    comment = Comment.find_by(id: params[:id])
    if not comment.present?
      render status: :bad_request
    end
    comment.content = params[:content]
    if comment.save
      render status: :ok
    else
      render status: :bad_request
    end
  end

  def delete
    comment = Comment.find_by(id: params[:id])
    if not comment.present?
      render status: :bad_request
    end
    if comment.delete
      render status: :ok
    else
      render status: :bad_request
    end
  end
end
