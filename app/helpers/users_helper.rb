module UsersHelper
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
