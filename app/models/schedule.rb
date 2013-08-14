class Schedule < ActiveRecord::Base
  attr_accessible :begin_date, :end_date, :title

  belongs_to :course
end
