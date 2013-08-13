class Course < ActiveRecord::Base
  attr_accessible :description, :end_date, :instructor, :release_date, :title

  has_and_belongs_to_many :users
end
