class Organization

  attr_accessor :code, :description, :parent_organization, :child_organizations, :organization_role_users

  def initialize(code, description, parent_organization, child_organizations)
    self.code = code
    self.description = description
    self.parent_organization = parent_organization
    self.child_organizations = child_organizations
  end

  # Get the organization's level in the heirarchy.
  # The root org will have level 1, its children 2, and the lowest valid level is 3
  def level
    self.parent_organization.nil? ? 1 : parent_organization.level + 1
  end

  # Checks to make sure the organization is connected to another organization
  # and that the level is under 4, as that is the requirement for the
  # organizational structure.
  def valid?
    ((self.parent_organization.nil? and self.child_organizations.nil?) or self.level > 3) ? false : true
  end

end
