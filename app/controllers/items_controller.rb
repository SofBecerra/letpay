class ItemsController < ApplicationController


  def create
    @bill = Bill.find(params[:bill_id])
    @item = Item.new(items[params_params])
  end

  def edit
  end


  def destroy
  end
end
