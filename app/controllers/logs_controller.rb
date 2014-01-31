class LogsController < ApplicationController
  def index
    @logs = Log.all
  end
end
