module ApplicationHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def upcoming_events
    upcoming = []
    @user.attended_events.each do |event|
      upcoming << event if event.date >= Time.zone.now
    end
    upcoming
  end

  def previous_events
    past = []
    @user.attended_events.each do |event|
      past << event if event.date < Time.zone.now
    end
    previous
  end

  # Returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = 'Private Events'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
