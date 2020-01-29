class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :event_attendees, foreign_key: 'attendee_id'
  has_many :attended_events, through: :event_attendees, foreign_key: 'attendee_id'

  validates :name, presence: true
  validates :email, presence: true

  def upcoming_events
    attended_events.where('date >= :current_time', current_time: DateTime.now)
  end

  def previous_events
    attended_events.where('date < :current_time', current_time: DateTime.now)
  end
end
