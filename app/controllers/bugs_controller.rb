class BugsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_post, only: [:show, :edit, :update, :destroy]


#@REVIEW: ADD BUG POLICIES
  def index
    @bug=Bug.all
  end

  def new
    @bug=Bug.new
    authorize @bug
  end

  def create
    
     @bug=Bug.new(bug_params)
     @bug.screenshot.url # => '/url/to/file.png'
     @bug.screenshot.current_path # 'path/to/file.png'
     @bug.screenshot.identifier # => 'file.png'
     @bug.creater_id = current_user.id
     @bug.project_id = params[:project_id]
     @bug.deadline = params[:bug][:deadline]
     authorize @bug
     if @bug.screenshot.content_type == 'image/png' || @bug.screenshot.content_type == 'image/gif'
        if @bug.save!
          redirect_to project_path(@bug.project_id)
        else
         render 'new'
        end
     end
  end


  def edit
     @bug = Project.find(params[:id])
  end

  def show
    @bug=Bug.all
  end

  private

   def bug_params
     params.require(:bug).permit(:id ,:title, :deadline, :screenshot, :bug_type, :status,)
   end

#@REVIEW: MISLEADING METHOD NAME
   def find_post
     @bug=Bug.find(params[:id])
   end

end
