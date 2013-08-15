class Schedule < ActiveRecord::Base
  attr_accessible :title, :content

  belongs_to :course
end
