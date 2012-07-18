class NewsController < ApplicationController
  load_and_authorize_resource :news
  
  def create
    @news.user ||= current_user
    if @news.save
      flash[:notice] = "News was successfully created."
      redirect_to @news
    else
      render action: "new"
    end
  end

  def update
    @news.user ||= current_user
      if @news.update_attributes(params[:news])
        flash[:notice] = "News was successfully updated." 
        redirect_to @news
      else
        render action: "edit"
      end
  end

  def destroy
    if @news.destroy
      flash[:notice] = "Message was deleted successfully."
      redirect_to news_index_url
    end
  end
end
