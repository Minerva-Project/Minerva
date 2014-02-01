class Course
  include Mongoid::Document
  
  field :title, :type => String, :default => ""
  has_and_belongs_to_many :users
  
end
