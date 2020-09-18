class MessagesController < ApplicationController

  before_action :require_user

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    message = current_user.messages.build(params.require(:message).permit(:body))
    if message.save
      ActionCable.server.broadcast "chatroom_channel", foo: message_render(message)
    end
  end

  private

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end
