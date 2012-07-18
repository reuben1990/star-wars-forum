class MessagesController < ApplicationController
  load_and_authorize_resource :message

  def create
    @message.user ||= current_user
    @message.save
  end
end
