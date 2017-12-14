class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
    # find_pic
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: 'Yesss! It was posted!'
    else
      render :new
    end
  end

  def edit
    # find_pic
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Congrats! Pic was updated.'
    else
      render :edit
    end
  end

  def destroy
    @pic.destroy

    redirect_to root_path
  end

  private
  def find_pic
    begin
      @pic = Pic.find(params[:id])
    rescue
      redirect_to root_path, notice: "There's no pics in the typed in location!"
    end
  end

  def pic_params
    params.require(:pic).permit(:title, :description)
  end

end
