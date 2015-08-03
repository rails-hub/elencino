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

end
