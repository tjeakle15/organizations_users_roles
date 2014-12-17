class Role

  attr_accessor :code, :description, :organization_role_users

  def initialize(code, description)
    self.code = code
    self.description = description
  end

  #
  # If Rails..
  #
  # for role in self.all
  #   self.const_set(role.code.upcase, role.id)
  # end
  # Since not rails, create the object and store as constant
  self.const_set("ADMIN", Role.new("ADMIN", "Admin"))
  self.const_set("USER", Role.new("USER", "User"))
  self.const_set("DENIED", Role.new("DENIED", "Denied"))
  self.const_set("NO_ROLE", Role.new("NO_ROLE", "No Role"))

end
