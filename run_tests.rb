#Dynamically find all the tests for these classes and print the results
puts "Running Tests"

@passed_array = Array.new
@failed_array = Array.new

OrganizationTest.singleton_methods(false).each do |method|
  if OrganizationTest.method(method).call then @passed_array.push("OrganizationTest.#{method}") else @failed_array.push("OrganizationTest.#{method}") end
end

RoleTest.singleton_methods(false).each do |method|
  if RoleTest.method(method).call then @passed_array.push("RoleTest.#{method}") else @failed_array.push("RoleTest.#{method}") end
end

UserTest.singleton_methods(false).each do |method|
  if UserTest.method(method).call then @passed_array.push("UserTest.#{method}") else @failed_array.push("UserTest.#{method}") end
end

OrganizationRoleUserTest.singleton_methods(false).each do |method|
  if OrganizationRoleUserTest.method(method).call then @passed_array.push("OrganizationRoleUserTest.#{method}") else @failed_array.push("OrganizationRoleUserTest.#{method}") end
end

for passed in @passed_array
  puts "PASSED: #{passed}"
end

for failed in @failed_array
  puts "FAILED: #{failed}"
end

puts "PASSED: #{@passed_array.size} FAILED: #{@failed_array.size}"

puts "Tests finished"