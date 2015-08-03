module ApplicationHelper

  def gender_lists
    I18n.t(:gender_lists).map { |key, value| [ value, key ] }
  end

  def matrimonial_regime_lists
    I18n.t(:matrimonial_regime_lists).map { |key, value| [ value, key ] }
  end

  def lot_status_lists
    I18n.t(:lot_status_lists).map { |key, value| [ value, key ] }
  end

  def enganche(lot)
    (lot.total.to_f * 0.30).to_f
  end

  def primer(lot)
    (enganche(lot) - ENV["APARTADO"].to_f).to_f
  end

  def mensualidades(lot)
    ((lot.total.to_f * 0.7) / 36).to_f
  end

  def precio_por_m2(lot)
    (lot.price.to_f * 0.9).to_f
  end

  def importe_total(lot)
    (precio_por_m2(lot) * (lot.area.to_f).to_f).to_f
  end

  def enganche_fifty(lot)
    (importe_total(lot) * 0.5).to_f
  end

  def primer_pago(lot)
    (enganche_fifty(lot) - ENV["APARTADO"].to_f).to_f
  end

  def precio_por(lot)
    ((lot.price.to_f * 0.9).to_f * 0.9 * 0.9).to_f
  end

  def importe(lot)
    (precio_por(lot) * lot.area.to_f).to_f
  end

  def finiquito(lot)
    (importe(lot) - ENV["APARTADO"].to_f).to_f
  end

end
