class OrganizationRoleUser

  attr_accessor  :organization, :role, :user

  def initialize(organization, role, user)
    self.organization = organization
    self.role = role
    self.user = user
  end

end
