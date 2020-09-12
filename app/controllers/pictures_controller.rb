class PicturesController < ApplicationController
  before_action :set_place, only: [:show, :new, :create]
  def index
    # @picture = Picture.find(params[:id])
  end

  def show
    # @image = Picture.find(params[:id])
    @picture = @place.pictures.find(params[:id])
  end

  

  

  def new
    @picture = Picture.new

    # @pictures = @place.pictures
  end

  def create
    picture = Picture.create(picture_params)

    if picture.save
      redirect_to @place
    else
      @posts = @place.posts
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:src, :text, :tags_ids).merge(place_id: params[:place_id]).merge(user_id: current_user.id)
  end

  

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_picture
    @picture = Picture.find(params[:place_id])
  end
end
