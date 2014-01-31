class Log < ActiveRecord::Base
  attr_accessible :action, :target, :date_time, :user_action
end
