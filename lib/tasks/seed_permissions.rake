require "#{Rails.root}/db/seeders/permission_seeder.rb"
namespace :db do
  task seed_permissions: :environment do
    PermissionSeeder.new.seed
  end
end