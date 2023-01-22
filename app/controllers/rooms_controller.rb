class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save ? redirect_to(room_path(@room)) : render("new")
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params) ? redirect_to(room_path(@room)) : render("edit")
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
