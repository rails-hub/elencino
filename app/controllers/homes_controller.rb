class HomesController < ApplicationController

  def masterplan

  end

  def amenidades
    redirect_to homes_path :anchor => "features"
  end

  def gallery

  end

  def disponibilidad

  end

  def facilidades

  end

  def cotizador
    redirect_to disponibilidad_homes_path :anchor => "cotizador"
  end

  def contacto

  end
end
