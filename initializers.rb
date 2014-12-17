#Populate demo data

puts "Initializing Values"

@root_org = Organization.new('ROOT_ORG', 'Root Org', nil, nil)

first_org_level_two = Organization.new("FIRST_ORG_LEVEL_2", "First Org Level 2", @root_org, nil)
second_org_level_two = Organization.new("SECOND_ORG_LEVEL_2", "Second Org Level 2", @root_org, nil)

@root_org.child_organizations = [first_org_level_two, second_org_level_two]

first_org_level_three = Organization.new("FIRST_ORG_LEVEL_3", "First Org Level 3", first_org_level_two, nil)
second_org_level_three = Organization.new("SECOND_ORG_LEVEL_3", "Second Org Level 3", first_org_level_two, nil)

first_org_level_two.child_organizations = [first_org_level_three, second_org_level_three]

third_org_level_three = Organization.new("THIRD_ORG_LEVEL_3", "Third Org Level 3", second_org_level_two, nil)
fourth_org_level_three = Organization.new("FOURTH_ORG_LEVEL_3", "Fourth Org Level 3", second_org_level_two, nil)

second_org_level_two.child_organizations = [third_org_level_three, fourth_org_level_three]

first_org_level_four = Organization.new("FIRST_ORG_LEVEL_4", "First Org Level 4", third_org_level_three, nil)

third_org_level_three.child_organizations = [first_org_level_four]

user_one = User.new("jsmith", nil)
user_two = User.new("pthompson", nil)
user_three = User.new("sjames", nil)
user_four = User.new("tjones", nil)

user_one_organization_role_user_one = OrganizationRoleUser.new(@root_org, Role::USER, user_one)
user_one_organization_role_user_two = OrganizationRoleUser.new(first_org_level_two, Role::ADMIN, user_one)
user_one_organization_role_user_three = OrganizationRoleUser.new(second_org_level_two, Role::DENIED, user_one)

user_one.organization_role_users = [user_one_organization_role_user_one, user_one_organization_role_user_two, user_one_organization_role_user_three]

user_two_organization_role_user_one = OrganizationRoleUser.new(@root_org, Role::DENIED, user_two)
user_two_organization_role_user_two = OrganizationRoleUser.new(first_org_level_two, Role::USER, user_two)
user_two_organization_role_user_three = OrganizationRoleUser.new(second_org_level_two, Role::ADMIN, user_two)

user_two.organization_role_users = [user_two_organization_role_user_one, user_two_organization_role_user_two, user_two_organization_role_user_three]

user_three_organization_role_user_one = OrganizationRoleUser.new(first_org_level_two, Role::USER, user_three)
user_three_organization_role_user_two = OrganizationRoleUser.new(second_org_level_two, Role::ADMIN, user_three)
user_three_organization_role_user_three = OrganizationRoleUser.new(fourth_org_level_three, Role::DENIED, user_three)

user_three.organization_role_users = [user_three_organization_role_user_one, user_three_organization_role_user_two, user_three_organization_role_user_three]

user_four_organization_role_user_one = OrganizationRoleUser.new(@root_org, Role::ADMIN, user_four)
user_four_organization_role_user_two = OrganizationRoleUser.new(second_org_level_two, Role::USER, user_four)
user_four_organization_role_user_three = OrganizationRoleUser.new(third_org_level_three, Role::DENIED, user_four)

user_four.organization_role_users = [user_four_organization_role_user_one, user_four_organization_role_user_two, user_four_organization_role_user_three]

@users = [user_one, user_two, user_three, user_four]

@root_org.organization_role_users = [user_one_organization_role_user_one]

first_org_level_two.organization_role_users = [user_one_organization_role_user_two]

second_org_level_two.organization_role_users = [user_one_organization_role_user_three]

puts "Values Initialized"

