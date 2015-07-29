class Lot < ActiveRecord::Base

  belongs_to :block

  validates :lot_number, :presence => true
  validates :area, :presence => true
  validates :price, :presence => true
  validates :total, :presence => true

end
