class ProjectsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @project=Project.all
  end

  def show
    @user = UsersProject.where(project_id: @project.id)
  end

  def new
  	@project=Project.new
    @user=User.where.not(user_type: 'manager')

  end

  def create
    @project=Project.new(project_params)

     if @project.save
      @userproject = UsersProject.new(project_id: @project.id, user_id: params['project']['users_project']['id'])
      @userproject.save
  	 	redirect_to root_path

  	 else
  	 	 render 'new'
  	 end

  end

  def edit
       @project = Project.find(params[:id])
       @user=User.where.not(user_type: 'manager')
  end
 
  def update
  
    @project = Project.find(params[:id])
      @userproject = UsersProject.new(project_id: @project.id, user_id: params['project']['users_project']['id'])
    if @userproject
      flash[:success] = "Successfully updated!"
      redirect_to @project
      # Handle a successful update.
      else
      render 'edit'
    end
  end


  def destroy
     Project.find(params[:id]).destroy
     flash[:success] = "Project deleted"
     redirect_to projects_url
  end

  

  private

   def project_params
     params.require(:project).permit(:id ,:name, users_project_attributes: [:user_id])
   end

   def find_post
     @project=Project.find(params[:id])
   end
end
