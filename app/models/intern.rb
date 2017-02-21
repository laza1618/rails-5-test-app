class Intern < User
  field :work_load, type: Integer , default: 13
  field :skills, type: Array, default: []

  #Elasticsearch index name
  index_name 'myjobglasses_homework_user'
  document_type 'user'

  after_update do |user|
    if user.work_load >= 20 || user.work_load < 0 || user.skills.length >= 7
      user.destroy
    end
  end

  # sample
  def self.sample_skills
    %w(Linux Development Hardware Python Ruby Web Java Git Elasticsearch)
  end

  def level_up
    update(work_load: work_load - rand(5), skills: skills.concat(Intern.sample_skills.sample(1)))
  end

  def hit_against_wall
    update(work_load: work_load * 2, skills: skills.drop(1))
  end
end
