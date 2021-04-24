class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_path(@group), notice: 'Band was successfully updated.'   }
      else
        format.html { render :edit }
      end
    end

  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Band was successfully deleted' }
    end

  end

  def index
    @groups = Group.all
  end

  private
  def group_params
    params.require(:group).permit(:name, :members, :debut_date, :group_type)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end