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
    @picture.tags.new
    
    
    # @pictures = @place.pictures
    
  end

  def create
   
    @picture = @place.pictures.new(picture_params)
    
    if @picture.save
      redirect_to @place
    else
      @pictures = @place.pictures
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
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
