# require 'rails_helper'

# # RSpec.describe Attendance, type: :model do
# #   pending "add some examples to (or delete) #{__FILE__}"
# # end

# RSpec.describe Attendance, type: :model do
#   context 'New Attendance object' do
#     describe '#new' do
#       at = Attendance.new
#       it 'should be valid with valid input' do
#         User.create(name: 'Bob')
#         User.last.events.create(title: 'Example', date: Time.now + 5000)
#         at.attend_event_id = Event.last.id
#         at.attendee_id = User.last.id
#         expect(at.valid?).to be_truthy
#       end

#       it 'should be invalid if user/event does not exist' do
#         at.attend_event_id = nil
#         at.attendee_id = nil
#         expect(at.valid?).to be_falsy
#         expect(at.errors.full_messages[0]).to include('must exist')
#         expect(at.errors.full_messages[1]).to include('must exist')
#       end

#       it 'Should assoc. User and event' do
#         User.create(name: 'Bob')
#         User.last.events.create(title: 'Example', date: Time.now + 5000)
#         at.attendee_id = User.last.id
#         at.attend_event_id = Event.last.id
#         expect(at.attend_event).to eq(at.attendee.events.last)
#       end
#     end
#   end
# end
