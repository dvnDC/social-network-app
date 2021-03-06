class ItemsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user, only: :destroy

  def index
    @items = Item.paginate(page: params[:page])
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)
    @item.image.attach(params[:item][:image])
    if @item.save
      flash[:success] = "Item created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Item deleted!"
    redirect_to request.referrer || root_url, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :price, :content, :image)
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to root_url if @item.nil?
  end
end
