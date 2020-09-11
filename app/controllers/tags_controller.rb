class TagsController < ApplicationController
  def search
    @tags = Tag.includes(:pictures, :picture_tags).search(params[:keyword])
    
  end
end
