class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])
  end

  def destroy
    # @item = Item.find(params[:id])
      if @item.destroy
        redirect_to items_path
      else
        render :show
      end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end