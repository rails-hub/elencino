class Block < ActiveRecord::Base

  belongs_to :phase
  has_many :lots

  validates :block_number, :presence => true

end
