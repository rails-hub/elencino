class Phase < ActiveRecord::Base

  belongs_to :user
  has_many :blocks

  validates :name, :presence => true


  def self.enganche(lot)
    (lot.total.to_f * 0.30).to_f
  end

  def self.primer(lot)
    (enganche(lot) - ENV["APARTADO"].to_f).to_f
  end

  def self.mensualidades(lot)
    ((lot.total.to_f * 0.7) / 36).to_f
  end

  def self.precio_por_m2(lot)
    (lot.price.to_f * 0.9).to_f
  end

  def self.importe_total(lot)
    (precio_por_m2(lot) * (lot.area.to_f).to_f).to_f
  end

  def self.enganche_fifty(lot)
    (importe_total(lot) * 0.5).to_f
  end

  def self.primer_pago(lot)
    (enganche_fifty(lot) - ENV["APARTADO"].to_f).to_f
  end

  def self.precio_por(lot)
    ((lot.price.to_f) * 0.9 * 0.9).to_f
  end

  def self.importe(lot)
    (precio_por(lot) * lot.area.to_f).to_f
  end

  def self.finiquito(lot)
    (importe(lot) - ENV["APARTADO"].to_f).to_f
  end

end
