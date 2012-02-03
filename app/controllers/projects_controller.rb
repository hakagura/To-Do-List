class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project=current_user.projects.build(params[:project])

    if @project.save
      redirect_to projects_url, :notice => '"Successfully created."'
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice  => "Successfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "Successfully destroyed."
  end

  def closed_task
    @task=Task.find(params[:task_id])
    @task.update_attribute(:status,"Closed")
    redirect_to @task.list.project, :notice => "Successfully destroyed."
  end
end
