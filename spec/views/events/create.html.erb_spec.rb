require 'rails_helper'

RSpec.describe 'events/create.html.erb', type: :view do
    include Capybara::DSL
    scenario 'valid inputs' do
        visit new_event_path
        fill_in 'Event Title:', with: 'Title'
        expect(page).to have_content('Title')
    end
end
