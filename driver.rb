require_relative 'models/organization'
require_relative 'models/role'
require_relative 'models/user'
require_relative 'models/organization_role_user'

require_relative 'tests/organization_test'
require_relative 'tests/role_test'
require_relative 'tests/user_test'
require_relative 'tests/organization_role_user_test'

#Run Tests
load 'run_tests.rb'

#Set up data
load 'initializers.rb'

#Loop thru all organizations and list out all users and their role
def loop_through_organizations(organization)
  text = organization.description

  if !organization.parent_organization.nil? then text = "#{text} below #{organization.parent_organization.description}" end

  puts text 

  for user in @users
    puts "  User: #{user.username} with Role: #{user.role_for_organization(organization).description}"
  end
  if !organization.child_organizations.nil? and !organization.child_organizations.empty?
    for child_organization in organization.child_organizations
      loop_through_organizations(child_organization)
    end
  end
end


loop_through_organizations(@root_org)
