class RolesController < ApplicationController
  layout 'admin'
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @roles = Role.all.order('id desc').page(params[:page]).per(10)
  end

  def show
    @role_permissions = @role.permissions.group_by { |i| i.subject_class }
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @permissions = Permission.all.group_by { |i| i.subject_class }
    @role_permissions = @role.permissions.to_a
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def set_permission
    role = Role.find(params[:role_id])
    if role
      role.assign_permission(Permission.find(params[:permit_id])) unless role.permissions.to_a.include?(Permission.find(params[:permit_id]))
      render json: {}, :status => :ok
    else
      render json: {message: 'NOT OK'}, status: :not_acceptable
    end
  end

  def remove_permission
    role = Role.find(params[:role_id])
    if role
      role.unassign_permission(Permission.find(params[:permit_id]))
    else
      flash[:alert] = 'Permission not removed'
      render edit_role_path(id: params[:role_id])
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :description, :created_by_id, :updated_by_id, :uuid)
  end
end
