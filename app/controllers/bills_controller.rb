class BillsController < ApplicationController

  def show
    @items = Item.all
    @bill = Bill.find(params[:id])
    @item = Item.new
  end

  def edit
  end

end
