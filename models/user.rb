class User

  attr_accessor :username, :organization_role_users

  def initialize(username, organization_role_users)
    self.username = username
    self.organization_role_users = organization_role_users
  end

  def role_for_organization(organization)
     result = nil
     role_array = nil
     if !self.organization_role_users.nil?
       role_array = self.organization_role_users.select { |x| x.organization == organization }
     end
     if (role_array.nil? or role_array.empty?) and !organization.parent_organization.nil?
       self.role_for_organization(organization.parent_organization)
     elsif !role_array.nil? and !role_array.first.nil?
       result = role_array.first.role
     else
       result = Role::NO_ROLE
     end
  end

end
