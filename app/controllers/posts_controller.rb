class PostsController < ApplicationController
  def show
    posts = Post.all
    render json: posts.map{ |post| post.to_api_format}, status: :ok
  end

  def add
  end

  def edit
  end
end
