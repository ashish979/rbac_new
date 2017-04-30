require 'securerandom'
class PermissionSeeder
  def seed
    yaml_object = YAML.load_file("#{Rails.root}/db/data/permissions.yml")
    env = yaml_object[Rails.env]
    permissions = env["permissions"]
    permissions.each do |permission|
      Permission.create(:description => permission["description"],:action => permission["action"],:subject_class => permission["subject_class"], uuid: SecureRandom.uuid)
    end
    puts "Permissions created"
  end
end