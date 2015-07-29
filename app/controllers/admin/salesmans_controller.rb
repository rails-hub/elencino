class Admin::SalesmansController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def index
    @users = User.with_role(:salesman)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def admin_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :password_confirmation)
  end

end