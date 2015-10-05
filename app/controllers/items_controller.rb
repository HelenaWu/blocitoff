class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(items_params)
    @item.status = false
    if current_user
      @item.user = current_user
    end
    if @item.save
      flash[:notice] = "post saved."
      redirect_to user_items_path
    else
      flash[:error] = "error saving."
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.status == false
      @item.status = true
    else
      @item.status = false
    end
    if @item.save
      flash[:notice] = "succesfully updated."
    else
      flash[:error] = "failed to update."
    end

    redirect_to user_items_path(current_user)
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "succesfully deleted."
      # redirect_to user_items_path(current_user)
    else
      flash[:error] = "failed to delete."
      # render :show
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
private
def items_params
  params.require(:item).permit(:description)
end
end
