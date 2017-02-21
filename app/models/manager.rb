class Manager < User
  field :team_size, type: Integer, default: 0

  def level_up
    update(team_size: team_size + rand(5))
  end

  def hit_against_wall
    update(team_size: team_size / 2)
  end
end
