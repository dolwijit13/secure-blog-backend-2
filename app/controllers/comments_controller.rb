class CommentsController < ApplicationController
  before_action :authorize_request
  before_action :set_comment, only: [:edit, :delete]

  def show
    comments = Comment.all
    render json: comments.map{ |comment| comment.to_api_format}, status: :ok
  end

  def add
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.post_id = params[:postId]
    @comment.display_name = @comment.user.display_name
    if @comment.save
      render status: :created
    else
      render status: :unauthorized
    end
  end

  def edit
    if not @comment.present?
      render status: :bad_request
    end
    @comment.content = params[:content]
    if @comment.save
      render status: :ok
    else
      render status: :bad_request
    end
  end

  def delete
    if not @comment.present?
      render status: :bad_request
    end
    if @comment.delete
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :postId)
    end
end
