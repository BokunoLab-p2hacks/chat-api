class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages.map(&:info)
  end
end
