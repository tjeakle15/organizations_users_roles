class RoleTest
  def self.initialize_test
    begin
	  result = Role.new("TEST_ROLE", "Test Role", 1)
    rescue
      result = false
    end
    result
  end
end
