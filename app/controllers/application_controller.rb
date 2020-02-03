class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :log_in, :logged_in?, :log_out, :created_events

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def created_events
    if @user.created_events.any?
      @user.created_events.each do |event|
        content_tag(:li, event.title)
        content_tag(:li, event.happening)
        content_tag(:li, event.location)
        button_to 'Details', "/events/#{event.id}", method: :get
      end
    else
      content_tag(:p, 'No events created')
    end
  end
end
