class Role

  attr_accessor :code, :description, :organization_role_users, :priority

  def initialize(code, description, priority)
    self.code = code
    self.description = description
    self.priority = priority
  end

  # Set the roles as constants, as they will be static
  # If a new role exists, we must define it in here.
  self.const_set("ADMIN", Role.new("ADMIN", "Admin", 100))
  self.const_set("USER", Role.new("USER", "User", 200))
  self.const_set("DENIED", Role.new("DENIED", "Denied", 300))
  self.const_set("NO_ROLE", Role.new("NO_ROLE", "No Role", 400))

end
