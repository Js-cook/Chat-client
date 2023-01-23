class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    if session[:user_id] != nil
      @room = Room.find(params[:id])
      @logged_user = User.find(session[:user_id])
    else
      redirect_to({controller: "user", action: "login"})
    end
  end

  def new
    if session[:user_id] != nil
      @room = Room.new
    else
      redirect_to({controller: "user", action: "login"})
    end
  end

  def create
    if session[:user_id] != nil
      @room = Room.new(room_params)
      @room.save ? redirect_to(room_path(@room)) : render("new")
    else
      redirect_to({controller: "user", action: "login"})
    end
  end

  def edit
    if session[:user_id] != nil
      @room = Room.find(params[:id])
    else
      redirect_to({controller: "user", action: "login"})
    end
  end

  def update
    if session[:user_id] != nil
      @room = Room.find(params[:id])
      @room.update(room_params) ? redirect_to(room_path(@room)) : render("edit")
    else
      redirect_to({controller: "user", action: "login"})
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
