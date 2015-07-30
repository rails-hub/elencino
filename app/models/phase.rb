class Phase < ActiveRecord::Base

  belongs_to :user
  has_many :blocks

  validates :name, :presence => true


end
