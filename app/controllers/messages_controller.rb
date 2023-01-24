class MessagesController < ApplicationController
  def new
  end

  def create
    data = params.permit(:content, :user, :room)
    @message = Message.new(content: data[:content], user: User.find(data[:user]), room: Room.find(data[:room]))
    if @message.save
      # Broadcast to channel
      puts "my nuts"
    end
  end

  def delete
  end
end
