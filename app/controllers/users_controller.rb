class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    unless current_user.admin?
      respond_to do |format|
        format.html { redirect_to '/', alert: "You don't have access to view that page" }
        format.json { render :show, status: :ok, location: @user }
      end
    end
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    unless current_user.admin? || @user.id == current_user.id
      respond_to do |format|
        format.html { redirect_to '/', alert: "You don't have access to view this user" }
        format.json { render :show, status: :ok, location: @user }
      end
    end
  end

  def changepassword
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.admin? || @user.id == current_user.id
      # Uploads picture to Cloudinary and sets url to the respective Cloudinary url
      unless params[:user][:picture].nil?
        unless params[:user][:picture] == @user.picture
          unless params[:user][:picture].empty? || Rails.env.test? # Lession learned, do not upload images in tests
            img = Cloudinary::Uploader.upload(params[:user][:picture])
            unless img['public_id'].empty?
              params[:user][:picture] = img['public_id']
            end
          end
        end
      end

      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to '/', alert: 'User not updated. You are not admin' }
        format.json { render :show, status: :ok, location: @user }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user.admin?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, alert: 'User not deleted: you are not admin.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :answered, :common, :email, :password, :password_confirmation, :picture)
  end
end
