class AttendancesController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)

    if @attendance.valid?
      @attendance.save
      flash[:alert] = 'You signed up to this event successfully!'
    end
    redirect_to @event
  end
end
