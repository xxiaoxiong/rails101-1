class GroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new]
  def index
    @groups = Group.all
  end

  def show
   @group = Group.find(params[:id])
 end


 def edit
   @group = Group.find(params[:id])
  end

  def new
   @group = Group.new
 end

 def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
     @group = Group.find(params[:id])
     if @group.update(group_params)
       redirect_to groups_path, notice: "Update Success"
     else
       render :edit
     end
   end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:alert] = "Group deleted"
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

end
