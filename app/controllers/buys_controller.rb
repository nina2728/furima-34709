class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_info, only: [:index, :create]
  before_action :item_unmatch, only: [:index, :create]
  before_action :item_sould, only: [:index, :create]

  def index
    @buy_receiver = BuyReceiver.new
  end

  def create
    @buy_receiver = BuyReceiver.new(buy_receiver_params)
    if @buy_receiver.valid?
      pay_item
      @buy_receiver.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_receiver_params
    params.require(:buy_receiver).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_info
    @item = Item.find(params[:item_id])
  end

  def item_unmatch
    redirect_to root_path if @item.user == current_user
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_receiver_params[:token],
      currency: 'jpy'
    )
  end

  def item_sould
    redirect_to root_path if @item.buy.present?
  end
end
