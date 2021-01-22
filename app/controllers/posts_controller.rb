class PostsController < ApplicationController
  def show
    posts = Post.all
    render json: posts.map{ |post| post.to_api_format}, status: :ok
  end

  def add
    post = Post.new(content: params[:content], user_id: params[:userId])
    post.display_name = post.user.display_name
    if post.save
      render status: :created
    else
      render status: :unauthorized
    end
  end

  def edit
  end
end
