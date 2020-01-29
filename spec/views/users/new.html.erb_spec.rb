require 'rails_helper'

RSpec.describe 'users/new.html.erb', type: :view do
  include Capybara::DSL
  scenario 'root page' do
    visit root_path
    expect(page).to have_button('Log in')
  end

  scenario 'show sign up link' do
    visit login_path
    expect(page).to have_link('Sign up now!')
  end
end