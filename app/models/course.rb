class Course < ActiveRecord::Base
  attr_accessible :description, :end_date, :instructor, :release_date, :title
end
