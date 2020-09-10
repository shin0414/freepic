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

    @pictures = @place.pictures
    @tag = Tag.new
  end

  def create
    # 順番入れ替え不可
    
    # tag_name = params[:picture][:name]
    # tag = Tag.create(name: tag_name)
    
    # picture = Picture.new(picture_params)
    # picture.save

    # PictureTag.create(picture_id: picture.id, tag_id: tag.id)
  
    tag_name = params[:picture][:name]
    tag_name1 = params[:picture][:name1]
    tag_name2 = params[:picture][:name2]
    tag = Tag.create(name: tag_name)
    tag1 = Tag.create(name: tag_name1)
    tag2 = Tag.create(name: tag_name2)
    
    picture = Picture.new(picture_params)
    picture.save

    PictureTag.create(picture_id: picture.id, tag_id: tag.id)
    PictureTag.create(picture_id: picture.id, tag_id: tag1.id)
    PictureTag.create(picture_id: picture.id, tag_id: tag2.id)




    # @picture = @place.pictures.new(picture_params)
    
    # if @picture.save
    #   redirect_to @place
    # else
    #   @pictures = @place.pictures
    #   flash.now[:alert] = 'メッセージを入力してください。'
    #   render :new
    # end

  end

  private

  def picture_params
    params.require(:picture).permit(:src).merge(place_id: params[:place_id])
  end

  

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_picture
    @picture = Picture.find(params[:place_id])
  end
end
