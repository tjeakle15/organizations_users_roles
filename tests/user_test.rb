class UserTest
  def self.initialize_test
    begin
      result = User.new("test", nil)
    rescue
      result = false
    end
    result
  end

  def self.role_for_organization_multiple_test
    #begin
      user = User.new("test_user", nil)
      organization = Organization.new("TEST_ORGANIZATION", "Test Organization", nil, nil)

      organization_role_user_one = OrganizationRoleUser.new(organization, Role::USER, user)
      organization_role_user_two = OrganizationRoleUser.new(organization, Role::ADMIN, user)

      user.organization_role_users = [organization_role_user_one, organization_role_user_two]
      organization.organization_role_users = [organization_role_user_one, organization_role_user_two]

      puts user.role_for_organization(organization).class

      if user.role_for_organization(organization).eql?(Role::ADMIN)
        result = true
      else
        result = false
      end

    #rescue
    #  result = false
    #end
    result
  end
end
