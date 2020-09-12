class PlacesController < ApplicationController
  def index
    @places = Place.includes(:posts, :pictures).order('created_at DESC')
    @pictures = Picture.all.order("updated_at DESC").limit(100)
  end

  def show
    @place = Place.includes(:posts, :pictures).find(params[:id])
    # @posts = Post.where(Place.find(params[:id]))
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save # ⬅2. 本のデータを保存する
        # ⬅3a. 成功したらshow画面へ
        format.html { redirect_to @place, notice: 'place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        # ⬅3b. 保存失敗したらnew画面へ（元の画面）
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end
  def place_params
    params.require(:place).permit(:title, :explanation).merge(user_id: current_user.id)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end
end
