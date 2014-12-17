class RoleTest
  def self.initialize_test
    begin
		result = Role.new("TEST_ROLE", "Test Role")
	rescue
		result = false
	end
	result
  end
end
