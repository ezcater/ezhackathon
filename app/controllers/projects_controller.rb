# frozen_string_literal: true

class ProjectsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @event = Event.find(params[:event_id])
    @project.event = @event
    if @project.save
      flash[:notice] = "Project added successfully"
      redirect_to @event
    else
      flash.now[:errors] = @project.errors.full_messages
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @event = Event.find(params[:event_id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    @event = Event.find(params[:event_id])
    if @project.update(project_params)
      flash[:success] = "Project successfully updated!"
      redirect_to event_project_path(@event, @project)
    else
      flash.now[:errors] = @project.errors.full_messages
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  private

  def project_params
    params.require(:project).permit(:idea_id, :additional_comments, :links)
  end
end
