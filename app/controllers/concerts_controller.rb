class ConcertsController < ApplicationController
  before_action :set_concert, only: %i[show edit update destroy]
  def new
    @groups = Group.all
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    if @concert.save
      redirect_to @concert
    else
      render :new
    end
  end

  def show
  end

  def edit
    @groups = Group.all
  end

  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to concert_path(@concert), notice: 'Concert was successfully updated.'   }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect to concerts_path, notice: 'Concert was successfully deleted' }
    end
  end

  def index
    @concerts = Concert.all
  end

  private
  def concert_params
    params.require(:concert).permit(:date, :group_id, :attendance, :duration)
  end

  def set_concert
    @concert = Concert.find(params[:id])
  end

end