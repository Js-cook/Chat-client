class MessagesController < ApplicationController
  def new
  end

  def create
    @message = Message.new(params.permit(:content, :user, :room))
    if @message.save
      # Broadcast to channel
      puts "my nuts"
    end
  end

  def delete
  end
end
