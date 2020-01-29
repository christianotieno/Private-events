require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Validation tests' do
    describe 'new' do
      at = Attendance.new

      it 'should be invalid if user - event does not exist' do
        at.attended_event_id = nil
        at.attendee_id = nil
        expect(at.valid?).to_not be_truthy
        expect(at.errors.full_messages[0]).to include('must exist')
        expect(at.errors.full_messages[1]).to include('must exist')
      end
    end
  end
end
