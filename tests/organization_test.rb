class OrganizationTest
  
  def self.initialize_test
    begin
      result = organization = Organization.new("ORGANIZATION_TEST", "Organization Test", nil, nil)
    rescue
      result = false
    end
    result
  end
  
  def self.level_test
    result = false
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]
      grandchild_test_org = Organization.new("GRANDCHILD_TEST_ORG", "Grandchild Test Org", child_test_org, nil)
      child_test_org.child_organizations = [grandchild_test_org]
      if parent_test_org.level == 1 and child_test_org.level == 2 and grandchild_test_org.level == 3 then
        result =  true
      end
    rescue
      result = false
    end
    result
  end

  def self.positive_valid_test
    result = false
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)
      child_test_org = Organization.new("CHILD_TEST_ORG", "Child Test Org", parent_test_org, nil)
      parent_test_org.child_organizations = [child_test_org]
  
      result = parent_test_org.valid?
    rescue
      result = false
    end
      result
  end

  def self.negative_valid_test
    result =  false
    begin
      parent_test_org = Organization.new("PARENT_TEST_ORG", "Parent Test Org", nil, nil)

      result = !parent_test_org.valid?
    rescue
      result = false
    end
    result
  end

end
