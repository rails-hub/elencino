class Admin::LotsController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def index
    @lots = Lot.all
  end

  def new
    @lot = Lot.new
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  def update
    lot = Lot.find(params[:id])
    if lot.update_attributes(lot_params)
      flash[:notice] = "Lot updated Successfully."
      redirect_to admin_lots_path
    else
      flash[:danger] = phase.errors.full_messages
      redirect_to edit_admin_lot_path
    end
  end

  def destroy
    phase = Lot.find(params[:id])
    phase.destroy
    flash[:notice] = "Lot Destroyed Successfully."
    redirect_to admin_lots_path
  end

  private

  def lot_params
    params.require(:lot).permit(:area, :status, :price, :total, :street)
  end

end