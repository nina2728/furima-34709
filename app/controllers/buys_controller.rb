class BuysController < ApplicationController
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
    params.require(:buy_receiver).permit(:item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_id).merge(:user_id current_user.id)
  end
end
