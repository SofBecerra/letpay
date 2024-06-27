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

  def update
    @bill = Bill.find(params[:id])
    @bill.update(bill_params)
  end

  def participants
    @items = Item.all
    @bill = Bill.find(params[:id])
    @event = @bill.event
    @item = Item.new
    @items = @bill.items
  end

  def calculate
    @bill = Bill.find(params[:id])
    @total = @bill.total_amount
    @consumptions = @bill.consumption_by_user
  end

  def items
    @items = Item.all
    @bill = Bill.find(params[:id])
    @event = @bill.event
    @item = Item.new
    @items = @bill.items
  end


  def layout
    @items = Item.all
    @bill = Bill.find(params[:id])
    @event = @bill.event
    @item = Item.new
    @items = @bill.items
  end

  private

  def bill_params
    params.require(:bill).permit(:total_amount, :total_items, :total_peruser)
  end
end
