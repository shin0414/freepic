class ImagesController < ApplicationController
  # before_action :set_place

  # def create
  #   @image = @post.images.new(image_params)
  #   if @image.save
  #     redirect_to @place
  #   else
  #     @images = @post.images
  #     flash.now[:alert] = 'メッセージを入力してください。'
  #     render :new
  #   end
  # end

  # private
  # def image_params
  #   params.require(:image).permit(:src)
  # end
  # def set_place
  #   @post = Post.find(params[:post_id])
  # end
end
