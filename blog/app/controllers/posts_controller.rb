class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = authorize(current_user.posts.build)
  end

  def edit
    @post = authorize(Post.find(params[:id]))
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def update
    @post = authorize(Post.find(params[:id]))
    @post.update(post_params)

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
