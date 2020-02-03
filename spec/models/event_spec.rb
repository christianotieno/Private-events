require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    subject do
      described_class.new(title: 'Title', description: 'Lorem ipsum',
                          happening: Time.now + 1.week, location: 'location', creator_id: 1)
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a happening' do
      subject.happening = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a creator_id' do
      subject.creator_id = nil
      expect(subject).to_not be_valid
    end
  end
end
