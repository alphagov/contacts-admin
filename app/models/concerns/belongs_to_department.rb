module BelongsToDepartment
  def department
    Department.find_by slug: department_id
  end

  def department=(department)
    self.department_id = department.is_a?(Department) ? department.slug : nil
  end
end
