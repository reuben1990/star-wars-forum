class CategoriesController < ApplicationController
  load_and_authorize_resource :category
  
  def create
    if @category.save
      flash[:notice] = "Category was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def update    
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category was updated successfully."
      redirect_to forums_url
    end
  end
  
  def destroy
    if @category.destroy
      flash[:notice] = "Category was deleted."
      redirect_to forums_url
    end
  end
end