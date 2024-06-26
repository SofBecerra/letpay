class ItemsController < ApplicationController


  def create
    @bill = Bill.find(params[:bill_id])
    @item = Item.new(item_params)
    @item.bill = @bill
    @item.user = current_user

    if @item.save!
      redirect_to bill_path(@bill)
    else
      render :new, status: :unprocessable_entity
    end
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

  private

  def item_params
    params.require(:item).permit(:category, :price)
  end
end
