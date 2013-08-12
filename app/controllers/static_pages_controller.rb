class StaticPagesController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def admin

  end

  def student

  end

  def teacher

  end
end
