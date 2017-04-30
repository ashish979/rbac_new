class RoleSeeder
  def seed
    yaml_object = YAML.load_file("#{Rails.root}/db/data/roles.yml")
    env = yaml_object[Rails.env]
    roles = env["roles"]
    roles.each do |role|
      Role.create(:name => role["name"], description: role["description"])
    end if roles
    puts "Roles created"
  end
end