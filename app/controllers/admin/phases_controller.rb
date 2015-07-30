class Admin::PhasesController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def index
    @phases = Phase.all
  end

  def new
    @phase = Phase.new
  end

  def edit
    @phase = Phase.find(params[:id])
  end

  def create
    phase = Phase.new(phase_params)
    phase.user = current_user
    if phase.save
      flash[:notice] = "Phase created Successfully."
      redirect_to  admin_phases_path
    else
      flash[:danger] = phase.errors.full_messages
      redirect_to new_admin_phase_path
    end
  end

  def update
    phase = Phase.find(params[:id])
    if phase.update_attributes(phase_params)
      flash[:notice] = "Phase updated Successfully."
      redirect_to admin_phases_path
    else
      flash[:danger] = phase.errors.full_messages
      redirect_to edit_admin_phase_path
    end
  end

  def destroy
    phase = Phase.find(params[:id])
    phase.destroy
    flash[:notice] = "Phase Destroyed Successfully."
    redirect_to admin_phases_path
  end

  def details
    @phase = Phase.find(params[:id])
    @blocks = @phase.blocks.includes(:lots).page(params[:page]).per(2)
  end

  def import
    phase = Phase.find(params[:id])
    ImportData.new(params[:file], phase).submit
    flash[:notice] = "Import Job Eunqued, It will be completed in a while."
    redirect_to details_admin_phase_path(phase)
  end

  private

  def phase_params
    params.require(:phase).permit(:name)
  end

end