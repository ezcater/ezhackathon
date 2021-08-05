# frozen_string_literal: true

class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      flash[:success] = "Idea successfully added!"
      redirect_to idea_path(@idea)
    else
      flash.now[:errors] = @idea.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
    render :edit
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:success] = "Idea successfully updated!"
      redirect_to idea_path(@idea)
    else
      flash.now[:errors] = @idea.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
    @idea = Idea.find(params[:id])
    render :show
  end

  private

  def idea_params
    params.require(:idea).permit(:submitter, :name, :tagline, :description, :resources, :snowflake_access,
                                 :value_delivered, :goal, :hours_estimate, :additional_comments, :links)
  end
end
