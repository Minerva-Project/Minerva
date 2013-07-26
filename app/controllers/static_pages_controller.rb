class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: 'index'

  def index
  end

  def admin
  end
end
