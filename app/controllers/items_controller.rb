class ItemsController < ApplicationController


  def create
    @bill = Bill.find(params[:bill_id])
    @item = Item.new(items[params_params])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(params[:item])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to bill_path, status: :see_other, notice: 'Item eliminado'
  end
end
