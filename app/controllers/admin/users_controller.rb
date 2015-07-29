class Admin::UsersController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin

  def create
    user = User.new(admin_params)
    user.add_role :"#{role_type_params[:type]}"
    if user.save
      flash[:notice] = "User Created Successfully."
      redirect_to role_type_params[:type] === 'manager' ? admin_managers_path : admin_salesmans_path
    else
      flash[:danger] = user.errors.full_messages
      redirect_to role_type_params[:type] === 'manager' ? new_admin_manager_path : new_admin_salesman_path
    end
  end

  def update
    user = User.find(params[:id])
    user_update = user.update_attributes(admin_params)
    if user_update
      flash[:notice] = "User Updated Successfully."
      redirect_to role_type_params[:type] === 'manager' ? admin_managers_path : admin_salesmans_path
    else
      flash[:danger] = user.errors.full_messages
      redirect_to role_type_params[:type] === 'manager' ? edit_admin_manager_path : edit_admin_salesman_path
    end
  end

  private

  def admin_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :password_confirmation)
  end

  def role_type_params
    params.require(:user).permit(:type)
  end

end