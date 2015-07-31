class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login
  before_save :add_search_terms

  has_many :phases
  has_one :client, dependent: :destroy

  accepts_nested_attributes_for :client


  validates :username,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            }
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def name
    "#{first_name} #{last_name}"
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def is_present(user_attendances, user)
    if user_attendances.where('user_id = ?', user.id).blank?
      return false
    else
      return true
    end
  end

  def my_clients
    users = []
    clients = Client.where('created_by = ?', self.id)
    users = User.where('id IN (?)', clients.collect(&:user_id)) unless clients.blank?
    users
  end

  private

  def add_search_terms
    self.search_terms = self.first_name.downcase + ' ' + self.last_name.downcase
  end

  def email_required?
    false
  end

end
