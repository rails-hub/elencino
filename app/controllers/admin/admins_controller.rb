class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_filter :is_admin_or_manager_or_salesman

  layout 'admin'

  def index

  end
end