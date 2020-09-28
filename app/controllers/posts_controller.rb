class PostsController < ApplicationController
  before_action :set_place
  def index
    @posts = @place.posts.all
  end

  def new
    @post = Post.new
    @posts = @place.posts
  end

  def create
    @post = @place.posts.new(post_params)
    if @post.save
      redirect_to @place
    else
      @posts = @place.posts
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  def destroy
    @post = @place.posts.find(params[:id])
    @post.destroy
    redirect_to @place
  end

  private

  def post_params
    params.require(:post).permit(:text,images_attributes: [:src, :id, :_dstroy])
    .merge(place_id: params[:place_id]).merge(user_id: current_user.id)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end


