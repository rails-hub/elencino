class Admin::ManagersController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def new
    @user = User.new
  end

  private

  def admin_params
    params.permit(:type)
  end

end