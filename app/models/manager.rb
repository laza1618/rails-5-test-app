class Manager < User
  field :team_size, type: Integer, default: 0

  def level_up
    update(team_size: team_size + 1)
  end
end
