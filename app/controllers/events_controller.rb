class EventsController < ApplicationController
  include ApplicationHelper
  before_action :login_required, only: %i[new create]
  before_action :current_user

  def index
    @upcoming_events = Event.upcoming
    @previous_events = Event.previous
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = @current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event saved!'
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :description, :happening, :title)
  end

  def login_required
    redirect_to login_path unless logged_in?
  end
end
