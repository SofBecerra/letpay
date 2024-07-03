class ItemsController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])
    @item = @bill.items.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to bill_path(@bill) }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@event) }
      end
    end
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(params[:item])
  end

  #el codigo destroy es invocado desde el formulario en bills con el path
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    #Cuando creamos los turbo_frame_tag para usar Hotwire, ahora el usuario hara peticiones a traves de TURBO
    respond_to do |format|
      format.html { redirect_to bill_path(@item.bill_id), status: :see_other, notice: "Item eliminado" } # va a redirigir ya que elimino el item
      format.turbo_stream  #esta linea manda a llamar al archivo destroy turbo del view
    end
  end

  private

  def item_params
    params.require(:item).permit(:category, :price)
  end
end
