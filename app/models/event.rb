class Event < ApplicationRecord
  belongs_to :creater, class_name: 'User',
                       foreign_key: 'creator_id'
  
  has_many :avent_attendees, class_name: 'Attendance',
                            foreign_key: 'attended_event_id'

  has_many :attendees, through: :attendancies, source: :attendee

end
