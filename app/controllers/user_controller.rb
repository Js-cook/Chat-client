class UserController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.permit(:username, :password))
    @user.save ? redirect_to({controller: "rooms", action: "index"}) : render("new")
  end

  def login
  end

  def login_req
    creds = params.permit(:username, :password)
    if User.find_by(username: creds[:username]).password == creds[:password]
      session[:user_id] = User.find_by(username: creds[:username]).id
      redirect_to({controller: "rooms", action: "index"})
    else
      redirect_to("login")
    end
  end

  def logout
    session[:user_id] = nil
  end
end
