class MessagesController < ApplicationController
  load_and_authorize_resource :message
 
  def index
    @messages = Message.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def chat
    @messages = Message.order("created_at DESC").limit(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render_for_api :public, :json => @messages, :root =>:messages }
    end 
  end

  def create
    @message.user ||= current_user 
    @message.save
  end
end
