class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages.map(&:info)
  end

  def create
    @message = Message.new(params_create)
    if @message.save
      render json: @message.info
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def params_create
    res = params.require(:message).permit(:content, :userId)
    res[:user_id] = res.delete(:userId)
    res
  end
end
