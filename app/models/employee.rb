class Employee < User
  field :skills_number, type: Integer, default: 1

  #Elasticsearch index name
  index_name 'myjobglasses_homework_user'
  document_type 'user'

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
