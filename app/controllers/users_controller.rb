class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.order('id desc').page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @user_roles = @user.roles.to_a
  end

  def new
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User Created successfully.'
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
    @user_roles = @user.roles.to_a
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'User Updated successfully.'
      redirect_to users_path
    else
      render action: 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = 'User Deleted successfully.'
      redirect_to users_path
    else
      flash[:error] = user.errors.full_messages
      render users_path
    end
  end

  def assign_role
    user = User.find(params[:id])
    role = Role.find(params[:role_id])

    if user.assign_role(role)
      render json: { success: 'Role Assigned' }
    else
      render json: { error: 'There was some problem' }, status: :unprocessable_entity
    end
  end

  def unassign_role
    user = User.find(params[:id])
    role = Role.find(params[:role_id])

    if user.unassign_role(role)
      render json: { success: 'Role Unassigned' }
    else
      render json: { error: 'There was some problem' }, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    # extracting username from email id (user doesn't need to provide username)
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

end
