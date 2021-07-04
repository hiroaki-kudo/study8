class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @picture = Picture.all
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.new(params_picture)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path
      else
        render :new
      end
    end
  end
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  def edit
  end
  def update
      if @picture.update(params_picture)
        redirect_to pictures_path
      else
        render :edit
      end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_path
  end
  def confirm
    @picture = Picture.new(params_picture)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end
  private
  def params_picture
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
