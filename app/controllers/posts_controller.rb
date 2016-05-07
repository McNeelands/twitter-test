class PostsController < ApplicationController
  before_action :require_user, only: [:index, :show]

  # def index
  #   @post = Post.new
  #   @posts = Post.paginate(page: params[:page])
  #  if request.xhr?
  #    render :partial=>"post_list"
  #  end
  # end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create

    @post = current_user.posts.create(post_params)
    # respond_to do |format|
    #   format.html
    #   format.js
    end
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end



  private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
