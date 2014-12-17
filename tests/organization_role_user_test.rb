class OrganizationRoleUserTest

  def self.initialize_test
    begin
		organization = Organization.new("ORGANIZATION_TEST", "Organization Test", nil, nil)
		user = User.new("test", nil)
		result = OrganizationRoleUser.new(organization, Role::ADMIN, user)
	rescue
		result = false
	end
	result
  end
  
  def self.explicit_level_one_test
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]
   
      user_one = User.new("user_one", nil)

      parent_organization_role_user = OrganizationRoleUser.new(parent_test_org, Role::ADMIN, user_one)
      user_one.organization_role_users = [parent_organization_role_user]
      parent_test_org.organization_role_users = [parent_organization_role_user]

      if user_one.role_for_organization(child_test_org).eql?(Role::ADMIN)
        result = true
      else
        result = false
      end
    rescue
      result = false
    end
    result
  end

  def self.explict_level_two_test
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new( "CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]

      user_one = User.new("user_one", nil)

      parent_organization_role_user = OrganizationRoleUser.new(parent_test_org, Role::ADMIN, user_one)
      child_organization_role_user = OrganizationRoleUser.new(child_test_org, Role::USER, user_one)
      user_one.organization_role_users = [parent_organization_role_user, child_organization_role_user]
      parent_test_org.organization_role_users = [parent_organization_role_user]
      child_test_org.organization_role_users = [child_organization_role_user]

      if user_one.role_for_organization(child_test_org).eql?(Role::USER)
        result = true
      else
        result = false
      end
    rescue
      result = false
    end
    result
  end

  def self.inherited_level_two_test
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]

      user_one = User.new("user_one", nil)

      parent_organization_role_user = OrganizationRoleUser.new(parent_test_org, Role::ADMIN, user_one)
      user_one.organization_role_users = [parent_organization_role_user]
      parent_test_org.organization_role_users = [parent_organization_role_user]

      if user_one.role_for_organization(child_test_org).eql?(Role::ADMIN)
        result = true
      else
        result = false
      end
    rescue
      result = false
    end
    result
  end

  def self.explict_level_three_test
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]
      grandchild_test_org = Organization.new("GRANDCHILD_TEST_ORG", "Grandchild Test Org", child_test_org, nil)
      child_test_org.child_organizations = [grandchild_test_org]

      user_one = User.new("user_one", nil)

      parent_organization_role_user = OrganizationRoleUser.new(parent_test_org, Role::ADMIN, user_one)
      child_organization_role_user = OrganizationRoleUser.new(child_test_org, Role::USER, user_one)
      grandchild_organization_role_user = OrganizationRoleUser.new(grandchild_test_org, Role::DENIED, user_one)
      user_one.organization_role_users = [grandchild_organization_role_user, child_organization_role_user, parent_organization_role_user]
      parent_test_org.organization_role_users = [parent_organization_role_user]
      child_test_org.organization_role_users = [child_organization_role_user]
      grandchild_test_org.organization_role_users = [grandchild_organization_role_user]

      if user_one.role_for_organization(grandchild_test_org).eql?(Role::DENIED)
        result = true
      else
        result = false
      end
    rescue
      result = false
    end
    result
  end

  def self.inherited_level_three_test
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]
      grandchild_test_org = Organization.new("GRANDCHILD_TEST_ORG", "Grandchild Test Org", child_test_org, nil)
      child_test_org.child_organizations = [grandchild_test_org]

      user_one = User.new("user_one", nil)

      parent_organization_role_user = OrganizationRoleUser.new(parent_test_org, Role::ADMIN, user_one)
      child_organization_role_user = OrganizationRoleUser.new(child_test_org, Role::USER, user_one)
      user_one.organization_role_users = [child_organization_role_user, parent_organization_role_user]
      parent_test_org.organization_role_users = [parent_organization_role_user]
      child_test_org.organization_role_users = [child_organization_role_user]

      if user_one.role_for_organization(grandchild_test_org).eql?(Role::USER)
        result = true
      else
        result = false
      end
    rescue
      result = false
    end
    result
  end

  def self.no_role_test
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]
      grandchild_test_org = Organization.new("GRANDCHILD_TEST_ORG", "Grandchild Test Org", child_test_org, nil)
      child_test_org.child_organizations = [grandchild_test_org]

      user_one = User.new("user_one", nil)

      if user_one.role_for_organization(grandchild_test_org).eql?(Role::NO_ROLE)
        result = true
      else
        result = false
      end
    rescue
      result = false
    end
    result
  end



end
