class BillsController < ApplicationController

  def show
    @items = Item.all
    @bill = Bill.find(params[:id])
    @event = @bill.event
    @item = Item.new
    @items = @bill.items
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  private

  def bil_params
    params.require(:bill).permit(:total_amount, :total_items, :total_peruser)
  end
end
