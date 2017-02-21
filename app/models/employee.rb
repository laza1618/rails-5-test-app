class Employee < User
  field :skills_number, type: Integer, default: 1

  after_update do |user|
    if user.skills_number <= 0
      user.destroy
    end
  end

  def level_up
    update(skills_number: skills_number * rand(3))
  end

  def hit_against_wall
    update(skills_number: skills_number - rand(5))
  end
end
