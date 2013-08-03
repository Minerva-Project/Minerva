class Profile < ActiveRecord::Base
  attr_accessible :image, :job, :languages, :religion, :school

  belongs_to :user

end
