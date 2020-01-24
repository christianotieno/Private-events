class Event < ApplicationRecord
  # validates :title, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :happening, presence: true

  belongs_to :creator, class_name: 'User' # references the creator_id in the User table
  has_many :event_attendings, foreign_key: 'attended_event_id', class_name: 'Attendance'
  has_many :attendees, through: :event_attendings, source: :attendee
end
