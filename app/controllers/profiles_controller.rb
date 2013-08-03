class ProfilesController < ApplicationController
  before_filter :load_user

  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  def new
    @user_id = params[:user_id]
    @id = params[:id]

    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  def edit
    if Profile.find_by_id(params[:id]) == nil
      redirect_to new_user_profile_path(@user)
    else
      @profile = Profile.find(params[:id])
    end
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.user = @user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @user, notice: 'Profile was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
