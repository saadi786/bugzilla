class ProjectsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    #@project = Project.all
    @project = current_user.projects
    #scope call
    @project=Project.project_sort
    # @project = Project.where(id: current_user.id)
    authorize @project 
  end

  def show
    @user = UserProject.where(project_id: @project.id)
    @bug=Bug.where(project_id: @project.id)
    
    
  end

  def new
    @project = Project.new
    @user = User.where(user_type: ['developer','qa'])
    authorize @project

  end
 
  def create
    @project=Project.new(project_params)
    # @userproject = UsersProject.new(project_params)
     authorize @project
     if @project.save
      @userproject = UserProject.new(project_id: @project.id, user_id: current_user.id)
      @userproject.save
      redirect_to root_path

     else
       render 'new'
     end

  end

  def edit
       @project = Project.find(params[:id])
       @user=User.where.not(user_type: 'manager')
       authorize @project
  end
 
   def update
      @project = Project.find(params[:id]).update(name: params[:project][:name])
      @userproject = UserProject.new(project_id: params[:id], user_id: params['project']['users_project']['id'])
      if @userproject.save
          flash[:success] = "Successfully updated!"
          redirect_to project_path
      else
        render 'edit'
      end
   end
  


  def destroy
    @userproject = UserProject.where(project_id: params[:id]).destroy_all
    @bug=Bug.where(project_id: params[:id]).destroy_all
    @project=Project.where(id: params[:id]).destroy_all
    authorize @project

    flash[:success] = "Project deleted"
    redirect_to projects_url
  end
   
   
   def assign
      @bug=Bug.find(params[:id])
      @bug=Bug.where(id: params[:id]).update(developer_id: current_user.id,status: 'started')
      
      redirect_to root_path

   end
  
  def mark
    @bug=Bug.find(params[:id])
    if @bug.bug_type == 'feature'
      @bug=Bug.where(id: params[:id]).update(developer_id: current_user.id,status: 'completed')
      
      redirect_to root_path

    else
      @bug=Bug.where(id: params[:id]).update(developer_id: current_user.id,status: 'resolved')
    
      redirect_to root_path

    end
  end
  

   private

   def project_params
     params.require(:project).permit(:id ,:name, users_project_attributes: [:user_id])
   end



   def set_post
     @project=Project.find(params[:id])
   end
end
