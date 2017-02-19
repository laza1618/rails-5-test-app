class Employee < User
  field :skills_number, type: Integer, default: 0

  def level_up
    update(skills_number: skills_number + 1)
  end
end
