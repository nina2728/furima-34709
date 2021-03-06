class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_info, only: [:show, :edit, :update, :destroy]
  before_action :item_authenticate, only: [:edit, :update, :destroy]
  before_action :item_sould, only: [:edit, :update, :destory]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_id, :prefecture_id, :shipping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def item_info
    @item = Item.find(params[:id])
  end

  def item_authenticate
    redirect_to root_path unless @item.user == current_user
  end

  def item_sould
    redirect_to root_path if @item.buy.present?
  end
end
