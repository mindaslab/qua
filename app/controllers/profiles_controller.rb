class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :profile_must_belong_to_user, :except=>[:new, :create, :index]
  # GET /profiles
  # GET /profiles.json
  def index
    redirect_to new_profile_path
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    # @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    unless current_user.profile
      @profile = Profile.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    else
      redirect_to current_user.profile
    end
  end

  # GET /profiles/1/edit
  def edit
    # @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to questions_path, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    # @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def profile_must_belong_to_user
    @profile = Profile.find(params[:id])
    begin
    redirect_to questions_path, notice: "You cannot acces this profile" unless @profile == current_user.profile
  rescue
    # incase the user has no profile
    redirect_to questions_path, notice: "You cannot acces this profile"
  end
  end
end
