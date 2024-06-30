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
    @bill = Bill.find(params[:id])
    @participants = @bill.users.distinct.select(:id, :nickname)
  end

  def calculate
    @bill = Bill.find(params[:id])
    @total = @bill.total_amount
    @consumptions = @bill.consumption_by_user
    @tip = Tip.new
    @tip_percent = Tip.where(bill_id: @bill.id).last.tip
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to bill_path, status: :see_other, notice: 'Item eliminado'
  end

  private

  def bill_params
    params.require(:bill).permit(:total_amount, :total_items, :total_peruser)
  end

  def item_params
    params.require(:item).permit(:category, :price, :item_id)
  end

  def tip_params
    params.require(:user).permit(:user_id, :tip)
  end


end
