class BuysController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_info, only: [:index, :create]
  before_action :item_unmatch, only: [:index, :create]
  
  def index
    @buy_receiver = BuyReceiver.new
  end

  def create
    @buy_receiver = BuyReceiver.create(buy_receiver_params)
    if @buy_receiver.valid?
      @buy_receiver.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_receiver_params
    params.require(:buy_receiver).permit(:item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_id).merge(user_id: current_user.id)
  end

  def item_info
    @item = Item.find(params[:item_id])
  end

  def item_unmatch
    if @item.user == current_user
      redirect_to root_path
    end 
  end
end
