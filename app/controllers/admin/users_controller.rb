class Admin::UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /networks
  # GET /networks.json
  def index
    @users = User.all
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
  end

  # GET /networks/new
  def new
    @user = User.new
  end

  # GET /networks/1/edit
  def edit
  end

  # POST /networks
  # POST /networks.json
  def create
    @user = User.create(user_params)
    @users = User.all

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to admin_user_path(@user), notice: 'User was successfully created.' }
    #   else
    #     format.html { render :new }
    #   end
    # end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    @users = User.all
    @user = User.find(params[:id])
    
    @user.update_attributes(user_params)

    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
    #   else
    #     format.html { render :edit }
    #   end
    # end
  end

  def delete
    @user = User.find(params[:user_id])
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @user.destroy
    @users = User.all
    # respond_to do |format|
    #   format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :role)
    end
end