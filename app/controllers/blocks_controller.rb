class BlocksController < ApplicationController

  def lots
    @block = Block.find(params[:id])
    lots = @block.lots
    render :json => {:lots => lots}
  end


end
