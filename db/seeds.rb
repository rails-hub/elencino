puts 'Setup roles'
Role.find_or_create_by!(name: :admin)
Role.find_or_create_by!(name: :manager)
Role.find_or_create_by!(name: :salesman)
Role.find_or_create_by!(name: :client)


puts 'Initializing users'
if User.find_by_email("#{ENV['ADMIN_EMAIL']}").blank?
  user = User.create(:email => "#{ENV['ADMIN_EMAIL']}", :password => "#{ENV['ADMIN_PWD']}", :password_confirmation => "#{ENV['ADMIN_PWD']}", :username => "#{ENV['ADMIN_USERNAME']}", :first_name => 'Rodrigo', :last_name => 'Macazaga')
  user.add_role :admin
  user.save!
end