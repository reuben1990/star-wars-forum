class CustomerMessagesController < ApplicationController
  load_and_authorize_resource :customer_message
  
  def create
    @customer_message.user ||= current_user
    if @customer_message.save
      flash[:notice] = "Message was successfully created."
      redirect_to @customer_message
    else
      render :action => 'new'
    end
  end

  def update
    @customer_message.user ||= current_user
    if @customer_message.update_attributes(params[:customer_message])
      flash[:notice] = "Message was updated successfully."
      redirect_to @customer_message
    else
      render :action =>  "edit"
    end
  end

  def destroy
    if @customer_message.destroy
      flash[:notice] = "Message was deleted successfully."
      redirect_to customer_messages_path
    end
  end
end
