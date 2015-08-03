class PhasesController < ApplicationController

  def blocks
    @phases = Phase.find(params[:id])
    blocks = @phases.blocks
    render :json => {:blocks => blocks}
  end


end
