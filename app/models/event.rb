class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :happening, presence: true
  validates :creator_id, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: 'attended_event_id'
  has_many :attendees, through: :event_attendees

  scope :upcoming, -> { where('happening >= ?', Time.now).order(date: :asc).includes(:creator) }
  scope :previous, -> { where('happening < ?', Time.now).order(date: :desc).includes(:creator) }
end
