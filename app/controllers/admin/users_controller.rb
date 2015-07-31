class Admin::UsersController < Admin::AdminsController
  before_action :authenticate_user!
  before_filter :is_admin_or_manager_or_salesman

  def create
    user = User.new(admin_params)
    user.add_role :"#{role_type_params[:type]}"
    if user.save
      save_client(user, true)
      flash[:notice] = "User Created Successfully."
      redirect_to role_type_params[:type] === 'manager' ? admin_managers_path : role_type_params[:type] == 'salesman' ? admin_salesmans_path : admin_clients_path
    else
      flash[:danger] = user.errors.full_messages
      redirect_to role_type_params[:type] === 'manager' ? new_admin_manager_path : role_type_params[:type] == 'salesman' ? new_admin_salesman_path : new_admin_client_path
    end
  end

  def update
    user = User.find(params[:id])
    user_update = user.update_attributes(admin_params)
    if user_update
      save_client(user, false)
      flash[:notice] = "User Updated Successfully."
      redirect_to role_type_params[:type] === 'manager' ? admin_managers_path : role_type_params[:type] == 'salesman' ? admin_salesmans_path : admin_clients_path
    else
      flash[:danger] = user.errors.full_messages
      redirect_to role_type_params[:type] === 'manager' ? edit_admin_manager_path : role_type_params[:type] == 'salesman' ? edit_admin_salesman_path : edit_admin_client_path
    end
  end

  private

  def save_client(user, new_client)
    if role_type_params[:type] === "client"
      client = new_client ?  Client.new(client_params[:client]) : Client.find_by_user_id(params[:id])
      client.user_id = user.id
      client.created_by = current_user.id
      client.attributes = client_params[:client_attributes]
      client.save!
    end
  end

  def admin_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :password_confirmation)
  end

  def client_params
    params.require(:user).permit(:client_attributes => [:client_id ,:dob, :nationality, :gender, :occupation, :is_married, :rfc,
                                                 :curp, :street, :interior_number, :exterior_number, :suburb,
                                                 :municipality, :state, :postal_address, :mobile_number, :office_number, :home_number], :client => [:client_id ,:dob, :nationality, :gender, :occupation, :is_married, :rfc,
                                                 :curp, :street, :interior_number, :exterior_number, :suburb,
                                                 :municipality, :state, :postal_address, :mobile_number, :office_number, :home_number])
  end

  def role_type_params
    params.require(:user).permit(:type)
  end

end