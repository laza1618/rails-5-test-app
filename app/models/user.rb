class User
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :gender, type: String

  validates :name, presence: true

  def self.genders
    ['man', 'woman']
  end

  def self.types
    ['Manager', 'Employee', 'Intern']
  end

  def level_up
  end

  def hit_against_wall
  end
end
