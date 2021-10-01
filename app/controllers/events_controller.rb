# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    if root_path? && recent_or_future_event.present?
      @event = recent_or_future_event

      render :show
    else
      @events = Event.order(time: :desc).all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = "Event successfully added!"
      redirect_to event_path(@event)
    else
      flash.now[:errors] = @event.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    render :edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event successfully updated!"
      redirect_to event_path(@event)
    else
      flash.now[:errors] = @event.errors.full_messages.join(", ")
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:time, :place, :agenda, :participants, :demo_links, :voting_status)
  end

  def recent_or_future_event
    @_recent_or_future_event ||= Event.recent_or_future.first
  end

  def root_path?
    request.path == "/"
  end
end
