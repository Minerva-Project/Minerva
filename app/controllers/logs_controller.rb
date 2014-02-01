class LogsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @logs = Log.all
  end
end
