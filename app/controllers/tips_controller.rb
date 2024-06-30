class TipsController < ApplicationController
  def create
    @tip = Tip.create(user: current_user, bill_id: params[:id], tip: params[:tip][:tip])
    redirect_to calculate_bill_path(@tip.bill_id)
  end
end
