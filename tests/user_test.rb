class UserTest
  def self.initialize_test
    begin
		result = User.new("test", nil)
	rescue
		result = false
	end
	result
  end
end
