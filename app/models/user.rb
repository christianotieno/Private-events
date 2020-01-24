class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy
  has_many :event_attendings, class_name: 'Attendance', foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, through: :event_attendings, source: :attended_event, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
end
