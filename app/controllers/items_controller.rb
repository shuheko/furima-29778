class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
    
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end



end
bundle exec rspec spec/models/item_spec.rb