require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email: 'foo@bar.com').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: 'foobar').save
      expect(user).to eq(false)
    end

    it 'ensures save successfully' do
      user = User.new(name: 'foobar', email: 'foo@bar.com').save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do
  end
end
