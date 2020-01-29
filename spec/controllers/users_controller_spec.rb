# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  describe 'Create new user' do
    it 'is not valid without user parameters' do
      @user = User.new
      expect(@user).to_not be_valid
    end

    it 'is not valid without a name and email' do
      @user = User.new(name: '', email:'')
      expect(@user).to_not be_valid
    end

    it 'user is valid having both email and name' do
      @user = User.new(name: 'name', email: 'user@mail.com')
      expect(@user).to be_valid
    end

    it 'name with more than 50 character length' do
      @user = User.new(name: 'a' * 51)
      expect(@user).to_not be_valid
    end
  end
end