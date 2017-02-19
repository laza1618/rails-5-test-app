class User
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :gender, type: String

  def self.genders
    ['man', 'woman']
  end

  def self.types
    ['Manager', 'Employee']
  end

  def level_up
  end
end
