class MessagesController < ApplicationController
  def new
  end

  def create
    data = params.permit(:content, :user, :room)
    @message = Message.new(content: data[:content], user: User.find(data[:user]), room: Room.find(data[:room]))
    @message.save ? MessagesChannel.broadcast_to(Room.find(data[:room]), {content: @message.content, user: @message.user.username}) : MessagesChannel.broadcast_to(Room.find(data[:room]), "An error occurred...")
  end

  def delete
  end
end
