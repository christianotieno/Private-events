class User < ApplicationRecord

  has_many :attendees,   class_name: 'Attendance',
                         foreign_key: 'attendee_id',
                         dependent: :destroy

  has_many :attended_events, through: :attendees, source: :attended_event
                         
  

  validates :name, presence: true
  validates :email, presence: true
end
