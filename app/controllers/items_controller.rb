class ItemsController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])
    @item = @bill.items.new(item_params)
    @item.user = current_user
    if @item.save!
      respond_to do |format|
        format.html {redirect_to bill_path(@bill)}
        format.turbo_stream
      end
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
    respond_to do |format|
      format.html { redirect_to bill_path(@item.bill_id), status: :see_other, notice: "Item eliminado" }
      format.turbo_stream
    end
  end

  private

  def item_params
    params.require(:item).permit(:category, :price)
  end
end
