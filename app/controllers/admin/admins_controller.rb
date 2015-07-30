class Admin::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_filter :is_admin_or_manager

  layout 'admin'

  def index

  end
end