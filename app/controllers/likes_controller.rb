class LikesController < ApplicationController

  def create
    post_id = params[:likes][:post_id]
    @like = Like.new({ post_id: post_id, user_id: current_user.id })
    if @like.save
      respond_to do |format|
        format.json { render json: {likes: @like.post.like_count.to_json, post: @like.post.id.to_json}}
        format.html {redirect_to posts_path}
      end
    else
      respond_to do |format|
        format.html {redirect_to '/posts'}
        format.json { render json: @resource }
      end
    end
  end



  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
