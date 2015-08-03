class Client < ActiveRecord::Base

  # belongs_to :user

  validates :salesman_id, :presence => true
  validates :name, :presence => true
  validates :first_last_name, :presence => true
  validates :second_last_name, :presence => true
  validates :email, :presence => true
end
