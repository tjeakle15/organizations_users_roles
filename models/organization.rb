class Organization

  attr_accessor :code, :description, :parent_organization, :child_organizations, :organization_role_users

  def initialize(code, description, parent_organization, child_organizations)
    self.code = code
    self.description = description
    self.parent_organization = parent_organization
    self.child_organizations = child_organizations
  end

  def level
    self.parent_organization.nil? ? 1 : parent_organization.level + 1
  end

  def valid?
    result = true
    if (self.parent_organization.nil? and self.child_organizations.nil?) or self.level > 3
      result = false
    end
   result
  end

end
