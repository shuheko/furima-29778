class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_order, only:[:index, :create]
  before_action :order_block, only:[:index, :create]
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
   
  end

  private

  def order_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_block
    if @item.order.present?
      redirect_to root_path
    elsif user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
