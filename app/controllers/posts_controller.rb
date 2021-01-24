class PostsController < ApplicationController
  before_action :authorize_request
  before_action :set_post, only: [:edit, :delete]

  def show
    posts = Post.all
    render json: posts.map{ |post| post.to_api_format}, status: :ok
  end

  def add
    @post = Post.new(post_params)
    @post.user = @user
    @post.display_name = @post.user.display_name
    if @post.save
      render status: :created
    else
      render status: :unauthorized
    end
  end

  def edit
    if not @post.present?
      render status: :bad_request
    end
    @post.content = post_params[:content]
    if @post.save
      render status: :ok
    else
      render status: :bad_request
    end
  end

  def delete
    if not @post.present?
      render status: :bad_request
    end
    @post.comments.map{ |comment| comment.delete}
    if @post.delete
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:content)
    end
end
