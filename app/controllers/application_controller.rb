require 'pp'
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(user)
    user_url(user)
  end
  
  def create_log(action_by, action, target)
    
    case action
    when "create_user"
      body = "#{action_by} criou o usuario #{target}"
    when "destroy_user"
      body = "#{action_by} excluiu o usuario #{target}"
    when "create_course"
      body = "#{action_by} criou o curso #{target}"
    when "destoy_course"
      body = "#{action_by} excluiu o curso #{target}"
    end
    
    Log.create(:body=>body)
  end
end
