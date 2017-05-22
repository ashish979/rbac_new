# This seed.rb file is responsible for creating the initial seed data for the application
# This file uses the seeder classes present in db/seeders directory to populate the data
# the seeders classes create data using the data files present in db/data directory

Dir.glob('db/seeders/*.rb').each do |file|
  load file
end

klasses = [PermissionSeeder, RoleSeeder]
klasses.each do |klass|
  klass.new.seed
end

super_admin_role = Role.create(name: "Super Admin", uuid: "super_admin", description: "super admin of the application")
super_admin_user = User.create(first_name: 'Super', last_name: 'Admin', email: 'ashishagrawal979@gmail.com', password: '12345678', password_confirmation: '12345678')
super_admin_user.assign_role(super_admin_role)