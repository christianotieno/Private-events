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

#   def create
#     @event = Event.find(params[:event_attendee][:attended_event_id])
#     current_user.event_attendees.create!(attended_event_id: @event.id)
#     redirect_to @event
#   end

#   def destroy
#   end
# end
