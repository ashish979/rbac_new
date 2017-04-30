# This seed.rb file is responsible for creating the initial seed data for the application
# This file uses the seeder classes present in db/seeders directory to populate the data
# the seeders classes create data using the data files present in db/data directory

Dir.glob('db/seeders/*.rb').each do |file|
  load file
end

klasses = [RoleSeeder, PermissionSeeder]
klasses.each do |klass|
  klass.new.seed
end

super_admin_role = Role.create(name: "Super Admin", uuid: "super_admin", description: "super admin of the application")
super_admin_user = User.create(full_name: 'Admin', email: 'admin@tinglado.in', password: 'tingladoErp@1234', password_confirmation: 'tingladoErp@1234')
super_admin_user.assign_role(super_admin_role)